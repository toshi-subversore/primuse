<p align="right"><a href="README.md">Original</a> · <strong>Português (Brasil)</strong></p>

# Sistema de ícones do Primuse

O catálogo de produção contém um ícone principal e seis alternativos:

- `00-soft-note.png` — ícone principal: colcheia tridimensional em creme, com sombra suave, sobre gradiente verde-menta para aqua. Foi o principal antes de Chris’s Muse, passou um dia como alternativo 18 e voltou a ser o principal; o número 18 foi aposentado.
- `19-chris-muse.png` — antigo ícone principal, mantido como alternativa: Chris’s Muse, criado por Chris, com nota branca tridimensional sobre vermelho no modo Light e nota rosa-avermelhada sobre carvão no Dark.
- `16-nonoend.png` — NonoEnd: clave de fá rosa-violeta. No Light, fica sobre gradiente cinza neutro com luz de borda no canto superior esquerdo e sombra projetada; no Dark, a mesma clave aparece sobre uma base índigo-ameixa profunda.
- `17-splash.png` — antigo ícone principal mantido como alternativa: splash tridimensional branco-leitoso com anel gravado e uma nota na abertura, sobre rosa berry sólido.
- `14-letter-p.png` — letra P no mesmo material, branca sobre azul-cobalto sólido. O bojo é aberto; a nota fica no canto inferior direito sobre a própria linha de base do P, e haste/bandeirola também formam um “r” minúsculo. Juntos, leem “Pr”.
- `15-folded-note.png` — ícone anterior de nota dobrada, mantido como alternativa.
- `12-pikaqiu.png` — ícone enviado por usuário, com nota musical em gradiente sobre fundo adaptativo claro, escuro ou tinted.

Private Library, Lossless Audio, Record Collection, Speaker Play, Muse Spark, Color Brush e Classic Record deixaram intencionalmente de fazer parte do catálogo.

## Sistema de aparência

Soft Note, Folded Note e Pikaqiu preservam seus PNGs Light, Dark e Tinted sem normalização de paleta. O Tinted do Soft Note é a exceção à polaridade normal do catálogo: usa glifo escuro sobre campo claro, em vez de glifo claro sobre fundo quase preto.

Splash e Letter P compartilham o mesmo material: glifo branco com sombreamento próprio e sombra suave sobre uma cor sólida. As versões Dark mantêm a composição, mas usam glifo colorido sobre carvão; as versões Tinted usam glifo prateado sobre quase preto.

NonoEnd começou com duas bases fornecidas contendo um par de colcheias ligadas. Essa composição — quadrado arredondado com o par centralizado — lembra visualmente o Apple Music, por isso o glifo foi substituído por uma clave de fá, preservando bases e material. A clave é desenhada como um campo de distância com sinal, usando uma linha central amostrada e meia-largura que afina ao longo do traço. O material foi medido na arte original: preenchimento vertical linear de RGB (248,135,231) no topo para (161,87,204) na base; somente no Light há borda branca acima à esquerda e sombra abaixo à direita, coerentes com uma luz principal vindo do canto superior esquerdo. Os dois fundos são ajustes polinomiais das bases fornecidas, amostrados longe do glifo e de sua sombra, com RMS residual 0,46 no Light e 0,83 no Dark. A variante Tinted deriva do Dark reconstruído: o fundo não ultrapassa aproximadamente 55 de luminância e o glifo não cai abaixo de aproximadamente 85, permitindo separação por um limiar suave de luminância.

Chris’s Muse preserva a arte de `19-chris-muse-light-original.jpg` e `19-chris-muse-dark-original.jpg`. Foi alternativo 13, depois brevemente o principal e hoje é o alternativo 19; o número 13 foi aposentado. A borda externa arredondada da arte fornecida é removida para evitar uma segunda borda quando a plataforma aplica a máscara; os highlights tridimensionais da nota são preservados. A variante Tinted usa nota branco-prateada sobre carvão. Os JPEGs originais selecionados permanecem ao lado dos PNGs preparados em `raw/`.

Todos os masters de iOS são PNG RGB full-bleed 1024×1024 sem máscara de canto da plataforma já aplicada. Os tamanhos de macOS são derivados do ícone Light principal com inset e máscara arredondada específicos da plataforma. watchOS usa a arte Light principal para manter o padrão consistente nas três plataformas.

## tvOS

No tvOS, o design Soft Note principal é recomposto em assets landscape/parallax independentes: glifo e sombra formam a camada transparente `Front`; o gradiente menta-aqua forma `Back`. Compor `Front` sobre `Back` reproduz a placa quadrada, então a sombra é codificada como preto com alpha e não gravada no fundo.

A separação é feita pela diferença entre canais: o glifo creme tem R ≈ G, enquanto o fundo menta mantém G ≫ R. O fundo é um ajuste polinomial amostrado longe do glifo e da sombra. `BrandMark` é a placa quadrada em 256×256. O gerador de ícone quadrado não cria nenhum desses assets; `Front` ocupa 63% da altura do canvas e a marca Top Shelf, 50%.

Estrutura dos assets:

- `Front` transparente + `Back` opaco em 400×240 e 800×480;
- `Front` + `Back` para App Store em 1280×768;
- Top Shelf em 1920×720 e 3840×1440;
- Top Shelf Wide em 2320×720 e 4640×1440.

## Regeneração

Execute `python3 scripts/generate_app_icon_assets.py` a partir da raiz do repositório. O script regenera iconsets iOS preservados e previews, ícones principais de macOS e watchOS, contact sheet e folha comparativa Light/Dark.

Os arquivos de origem ficam em `raw/`. `00-soft-note*.png` e `15-folded-note*.png` preservam a arte exatamente como fornecida. O prefixo `NN-` é o número do ícone alternativo; `00-` identifica o design atualmente principal. Números aposentados nunca são reutilizados. As imagens de preview dentro do app são geradas em 512×512.
