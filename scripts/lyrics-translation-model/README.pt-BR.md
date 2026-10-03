<p align="right"><a href="README.md">Original</a> · <strong>Português (Brasil)</strong></p>

# Modelo offline de tradução de letras — inglês ↔ persa

O framework Translation da Apple não oferece suporte a persa (#48). Este modelo adiciona os dois sentidos inglês ↔ persa e funciona inteiramente no dispositivo depois do download, sem rede e sem chave de API.

O modelo não é incluído no pacote principal do app. Ele é distribuído como o pacote sob demanda `LyricsTranslationModel` por Background Assets, a partir da versão 26.4. A extensão `PrimuseKaraokeModelDownloader`, já existente, faz o download e aceita todos os pacotes de recursos. No app, consulte `LocalLyricsTranslationModel` e `LocalLyricsTranslationService`.

## Origem e licenciamento

- Modelo estudante `tiny` do Mozilla Firefox Translations, sob MPL-2.0. O Firefox usa versões int8 da mesma família para tradução de páginas. Origem, formato de código-fonte e alterações estão descritos em `NOTICE.txt`; a licença completa fica em `LICENSE-MPL-2.0.txt`. Ambos são distribuídos junto do pacote.
- Os dados de treinamento vêm de corpora públicos como OPUS/HPLT e carregam as mesmas limitações conhecidas de outros modelos abertos de tradução.
- Modelos avaliados e não escolhidos, usando as primeiras 50 frases do FLORES-200 devtest em en→fa, decodificação gulosa e chrF++: este modelo 53,9; Helsinki OPUS-MT `tc-bible-big` 49,9; M2M100 418M 44,9, com zh→fa 39,4; OPUS-MT `en-iir` 16,6. NLLB e `persiannlp` mT5 possuem licenças não comerciais e não foram testados para uso no produto.

## Gerar o pacote de recursos

1. Baixe os modelos estudantes float32 públicos da Mozilla em `student-finetuned/`: `final.model.npz.best-chrf.npz` e `vocab.en.spm`. Os caminhos estão documentados em `NOTICE.txt`.
2. Converta em qualquer plataforma com Python:

```sh
python3 -m venv env
env/bin/pip install --index-url https://download.pytorch.org/whl/cpu torch==2.5.0
env/bin/pip install coremltools==8.3.0 numpy
env/bin/python convert_firefox_translations.py en-fa/final.model.npz.best-chrf.npz en-fa.mlpackage
env/bin/python convert_firefox_translations.py fa-en/final.model.npz.best-chrf.npz fa-en.mlpackage
```

3. Em um Mac, compile e empacote. `manifest.json`, `translation-model.json`, os dois arquivos de licença e os artefatos compilados devem estar no mesmo diretório:

```sh
xcrun coremlcompiler compile en-fa.mlpackage .
xcrun coremlcompiler compile fa-en.mlpackage .
cp en-fa/vocab.en.spm vocab.enfa.spm
cp fa-en/vocab.en.spm vocab.faen.spm
ba-package manifest.json -o LyricsTranslationModel.aar
```

4. No App Store Connect, envie `LyricsTranslationModel.aar` em Background Assets. O ID do pacote deve ser exatamente `LyricsTranslationModel`. Somente builds do TestFlight e App Store podem baixar o recurso hospedado.

## Restrições

- **O cálculo deve usar fp32.** Em fp16 a saída de um único passo coincide com PyTorch, mas o estado SSRU acumula erro progressivamente e passa a repetir/misturar palavras após alguns passos; no FLORES, o chrF++ cai de 52 para 38. Armazenar os pesos em int8 é aceitável e reduz o chrF++ em apenas cerca de 0,2.
- A execução é em CPU, usando `.cpuOnly`. Em um M2, o Neural Engine não foi mais rápido, duplicou o uso de memória e `.all` apresentou travamentos ocasionais de cerca de 2 segundos.
- Ao trocar o modelo, altere também o campo `version` de `translation-model.json`. Ele faz parte da chave de cache, impedindo que traduções antigas sejam reutilizadas por um novo modelo.
- A tokenização usa `SentencePieceUnigramTokenizer` do PrimuseKit e não depende da biblioteca sentencepiece. A normalização `nmt_nfkc` é reproduzida pelo código de referência; o ZWNJ do persa vira espaço.
- Para depuração local, um build Debug pode definir `PRIMUSE_LYRICS_TRANSLATION_MODEL=<diretório no layout do pacote>` para ignorar o download.

## Medições — 26/09/2026, Mac mini M2, pesos int8 + fp32 + CPU

| Direção | chrF++ nas primeiras 150 frases do FLORES-200 devtest | Saída idêntica à Mozilla | Por linha de letra | Frase longa de notícia | Carregamento | Pico de memória |
|---|---:|---:|---:|---:|---:|---:|
| en→fa | 52,2, oficial completo 51,3 | 126/150 | ~11 ms, carga 5 | ~33 ms, carga 5 | 0,2–0,7 s | ~100 MB |
| fa→en | 57,1, oficial completo 58,3 | 112/150 | ~40 ms, carga 150 | ~140 ms, carga 150 | 0,4–0,6 s | ~100 MB |

Quando a máquina de compilação está ocupada por outras tarefas, com carga acima de 100, os tempos ficam aproximadamente 3–4× maiores que em repouso. No app, o modelo carregou em até 0,6 s após abrir a tela de reprodução e traduziu uma música de 20 linhas em menos de 1 s. Letras coloquiais apresentam resultado natural; poesia persa clássica, como Hafez e Rumi, fica muito pior, o que é uma limitação esperada para um modelo desse porte.

Velocidade, memória e aquecimento ainda não foram medidos em iPhone ou Apple TV físicos.
