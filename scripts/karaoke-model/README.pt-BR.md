<p align="right"><a href="README.md">Original</a> · <strong>Português (Brasil)</strong></p>

# Modelo de voz por IA para o modo Karaokê

A separação de vocais do modo Karaokê usa o Hybrid Transformer Demucs v4 da Meta, sob licença MIT; consulte `LICENSE-demucs.txt`.

O modelo não é incluído no pacote principal do app. Ele é distribuído como um pacote de recurso sob demanda hospedado pela App Store, usando Background Assets. O sistema baixa o pacote por meio da extensão `PrimuseKaraokeModelDownloader`; no app, consulte `KaraokeVocalModel`.

## Gerar o pacote de recursos

1. Converta o modelo em qualquer plataforma com Python:

```sh
python3 -m venv env
env/bin/pip install --index-url https://download.pytorch.org/whl/cpu torch==2.5.0 torchaudio==2.5.0
env/bin/pip install coremltools==8.3.0 demucs==4.0.1 numpy
env/bin/python convert_htdemucs.py --output HTDemucsVocals.mlpackage
```

2. Em um Mac, compile para `.mlmodelc` e empacote. `manifest.json` e o produto compilado devem ficar no mesmo diretório:

```sh
xcrun coremlcompiler compile HTDemucsVocals.mlpackage .
ba-package manifest.json -o KaraokeVocalModel.aar
```

3. No App Store Connect, envie `KaraokeVocalModel.aar` em **Background Assets / pacotes de recursos do app**. O ID do pacote deve ser exatamente `KaraokeVocalModel`. Apenas builds do TestFlight e App Store podem baixar recursos hospedados pela Apple.

## Restrições

- Ao trocar o modelo, atualize também `KaraokeVocalModel.cacheVersion` para impedir a reutilização de resultados antigos de separação.
- O modelo deve executar em CPU + GPU. O Neural Engine usa internamente meia precisão; o ramo espectral pode sofrer overflow e produzir resultados incorretos.
- Para depuração local, um build Debug pode usar `PRIMUSE_KARAOKE_MODEL=<caminho para .mlmodelc ou .mlpackage>` para ignorar o download.
