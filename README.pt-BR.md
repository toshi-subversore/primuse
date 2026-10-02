<p align="right"><a href="README.md">中文</a> · <a href="README.en.md">English</a> · <strong>Português (Brasil)</strong></p>

# Primuse

<p align="center">
  <a href="https://testflight.apple.com/join/AjbPukaF">
    <img src="https://img.shields.io/badge/TestFlight-Participar_do_Beta-0D96F6?logo=apple&logoColor=white&style=for-the-badge" alt="Participar do beta do Primuse no TestFlight"/>
  </a>
  <a href="https://apps.apple.com/us/app/%E7%8C%BF%E9%9F%B3/id6761675450">
    <img src="https://img.shields.io/badge/App_Store-Baixar-007AFF?logo=apple&logoColor=white&style=for-the-badge" alt="Baixar na App Store"/>
  </a>
</p>

> **Teste a versão mais recente:** [participe do beta no TestFlight](https://testflight.apple.com/join/AjbPukaF)

O Primuse é um player de música nativo e multiorigem para o ecossistema Apple. Ele reúne arquivos locais, dispositivos NAS, servidores de mídia, serviços de armazenamento em nuvem, rádios pela internet e Apple Music em uma única biblioteca e fila de reprodução, com decodificação de alta fidelidade, divisão de faixas por CUE, letras sincronizadas por palavra, descoberta inteligente, sincronização entre dispositivos e controles de reprodução do sistema.

A versão estável está disponível na App Store. Pesquise por “Primuse” ou use o botão de download acima.

## Documentação

- [中文说明](README.md) · [English README](README.en.md) · [README em Português (Brasil)](README.pt-BR.md)
- [中文更新日志](Docs/CHANGELOG.md) · [English Changelog](Docs/CHANGELOG.en.md)
- [Capturas de tela](#capturas-de-tela) · [Aplicativo para macOS](#aplicativo-para-macos) · [Aplicativo para Apple TV](#aplicativo-para-apple-tv) · [Apple Watch e integração com o sistema](#apple-watch-e-integração-com-o-sistema)
- [Fontes de música](#fontes-de-música) · [Rádio, descoberta e personalização](#rádio-descoberta-e-personalização) · [Reprodução e formatos](#reprodução-e-formatos) · [Letras e metadados](#letras-e-metadados) · [Biblioteca e sincronização](#biblioteca-e-sincronização)
- [Primeiros passos](#primeiros-passos) · [Fontes personalizadas de scraping](#fontes-personalizadas-de-scraping) · [Estrutura do projeto](#estrutura-do-projeto) · [Arquitetura](#arquitetura)

## iPhone e iPad

- **Interface nativa adaptável** — navegação por abas no iPhone, com layouts compactos para orientação horizontal, Split View e telas dobráveis; no iPad há biblioteca em visualização dividida, player em duas colunas e suporte a múltiplas janelas
- **Biblioteca móvel completa** — importe músicas pelo app Arquivos, conecte fontes remotas, escaneie pastas e pesquise ou gerencie playlists e estações salvas em conteúdo local, NAS, servidores e nuvem
- **Player completo em qualquer lugar** — alterne entre capa, letras, fila e diferentes cenas imersivas; confira a qualidade real do áudio, ajuste velocidade e efeitos, escolha uma saída AirPlay e corrija metadados manualmente
- **Reprodução em segundo plano e controles do sistema** — áudio em segundo plano, controles na Tela Bloqueada e na Central de Controle, além de botões de fones/Bluetooth; o controle de volume altera o nível do próprio Primuse sem modificar o volume de saída do sistema

## Capturas de tela

<p align="center">
  <img src="Docs/screenshots/ios/en-US/01-home.jpg" width="160" alt="Primuse em dispositivos Apple"/>
  <img src="Docs/screenshots/ios/en-US/02-appearance.jpg" width="160" alt="Fontes locais, NAS e nuvem"/>
  <img src="Docs/screenshots/ios/en-US/03-songs.jpg" width="160" alt="Pastas e etiquetas de rádio"/>
  <img src="Docs/screenshots/ios/en-US/04-albums.jpg" width="160" alt="CarPlay, Apple Watch e Siri"/>
  <img src="Docs/screenshots/ios/en-US/05-playlists.jpg" width="160" alt="Player imersivo em modo horizontal"/>
</p>
<p align="center">
  <img src="Docs/screenshots/ios/en-US/06-search.jpg" width="160" alt="Edição de letras e tags"/>
  <img src="Docs/screenshots/ios/en-US/07-now-playing.jpg" width="160" alt="Transferência entre dispositivos e sincronização pelo iCloud"/>
  <img src="Docs/screenshots/ios/en-US/08-lyrics.jpg" width="160" alt="Compartilhamento de pôsteres com letras"/>
  <img src="Docs/screenshots/ios/en-US/09-sources.jpg" width="160" alt="Recomendações inteligentes e descoberta por cenas"/>
  <img src="Docs/screenshots/ios/en-US/10-equalizer.jpg" width="160" alt="Equalizador e efeitos de áudio"/>
</p>

## Aplicativo para macOS

O cliente para Mac usa um layout nativo de desktop e compartilha biblioteca, fontes de música, playlists e dados do iCloud com iPhone, iPad e Apple TV.

<table>
  <tr>
    <td align="center"><img src="Docs/screenshots/macos/en-US/01-home.jpg" width="420" alt="Biblioteca no macOS"/><br/>Biblioteca e reprodução no desktop</td>
    <td align="center"><img src="Docs/screenshots/macos/en-US/02-sources.jpg" width="420" alt="Fontes no macOS"/><br/>Gerenciamento de fontes</td>
  </tr>
  <tr>
    <td align="center"><img src="Docs/screenshots/macos/en-US/03-songs.jpg" width="420" alt="Biblioteca de rádio no macOS"/><br/>Pastas e etiquetas de rádio</td>
    <td align="center"><img src="Docs/screenshots/macos/en-US/04-now-playing.jpg" width="420" alt="Ferramentas de reprodução no macOS"/><br/>Mini player, barra de menus e letras na mesa</td>
  </tr>
  <tr>
    <td align="center"><img src="Docs/screenshots/macos/en-US/05-mini-player.jpg" width="420" alt="Player imersivo no macOS"/><br/>Capa, letras e cenas imersivas em tela cheia</td>
    <td align="center"><img src="Docs/screenshots/macos/en-US/06-desktop-lyrics.jpg" width="420" alt="Editor de letras no macOS"/><br/>Edição de letras e sincronização por palavra</td>
  </tr>
  <tr>
    <td align="center" colspan="2"><img src="Docs/screenshots/macos/en-US/07-menu-bar.jpg" width="860" alt="Transferência entre dispositivos e sincronização pelo iCloud no macOS"/><br/>Transferência entre dispositivos e sincronização pelo iCloud</td>
  </tr>
</table>

### Recursos específicos do macOS

- **Interface nativa para desktop** — barra de título personalizada, barra lateral recolhível, barra de reprodução inferior e visualizações em tabela/pesquisa otimizadas para bibliotecas grandes
- **Mini player e player na barra de menus** — alterne entre painel flutuante, popover na barra de menus e janela principal mantendo letras e fila sempre acessíveis
- **Letras na mesa** — janela flutuante independente para letras, com layouts de duas linhas, uma linha, vertical, bloqueado e com passagem de cliques
- **Importação da biblioteca Apple Music / iTunes** — lê músicas e playlists acessíveis pelo app Música no Mac; arquivos locais não protegidos por DRM e legíveis podem ser reproduzidos diretamente
- **Controle profissional de saída** — escolha o dispositivo de áudio, use volume no nível do aplicativo e alterne entre caminhos de alta fidelidade e processamento de efeitos
- **Ferramentas completas de biblioteca** — playlists inteligentes, limpeza de duplicados, edição de tags, importação/exportação de playlists e janela dedicada de scraping em lote
- **Widgets de desktop e reprodução em múltiplas telas** — widgets WidgetKit para Reprodução Atual, letras, estatísticas e outros, além de capa e letras em tamanho grande em monitor externo
- **Transmissão DLNA e controles do sistema** — descubra renderizadores locais e transmita para eles, com suporte a teclas de mídia e atalhos personalizados
- **Personalização visual** — modos claro/escuro, temas, cores dinâmicas derivadas da capa e vários ícones alternativos do aplicativo

## Aplicativo para Apple TV

O cliente para Apple TV permite navegar por toda a biblioteca, conectar diferentes tipos de fonte e receber do iPhone, via iCloud ou rede local, dados da biblioteca, credenciais e configuração de reprodução.

<table>
  <tr>
    <td align="center"><img src="Docs/screenshots/tv/en-US/01-home.jpg" width="420" alt="Início no Apple TV"/><br/>Sua música no Apple TV</td>
    <td align="center"><img src="Docs/screenshots/tv/en-US/02-library.jpg" width="420" alt="Fontes de música no Apple TV"/><br/>Fontes diretas e transferência por QR Code</td>
  </tr>
  <tr>
    <td align="center"><img src="Docs/screenshots/tv/en-US/03-playlists.jpg" width="420" alt="Rádio no Apple TV"/><br/>Estações de rádio salvas</td>
    <td align="center"><img src="Docs/screenshots/tv/en-US/04-search.jpg" width="420" alt="Letras sincronizadas no Apple TV"/><br/>Capa e letras sincronizadas</td>
  </tr>
  <tr>
    <td align="center" colspan="2"><img src="Docs/screenshots/tv/en-US/05-now-playing.jpg" width="860" alt="Player imersivo no Apple TV"/><br/>Capa em tela cheia e cenas imersivas</td>
  </tr>
</table>

### Recursos específicos do Apple TV

- **Navegação pela biblioteca inteira** — navegue por álbuns, artistas, músicas, playlists e rádios, com Reproduzir Tudo, Aleatório e suporte ao Siri Remote
- **Fontes diretas e relays** — WebDAV, UPnP/DLNA, serviços de nuvem e bibliotecas de servidores usam seus próprios resolvedores; SMB, NFS e FTP podem ser lidos diretamente na TV, enquanto algumas outras fontes podem usar o relay LAN opcional do iPhone
- **Transferência de configuração por QR Code** — o Apple TV exibe um QR Code de uso único para que um iPhone envie com segurança, pela rede local, um snapshot da biblioteca, fontes de música e credenciais criptografadas, sem exigir que os dois dispositivos usem o mesmo Apple ID
- **Gerenciamento de credenciais** — use sincronização pelo iCloud, pareamento pela LAN ou credenciais inseridas diretamente na TV para os tipos de servidor compatíveis
- **Letras sincronizadas** — carregue letras do cache local, de sidecars da fonte ou de um servidor, incluindo progresso por linha/palavra e traduções
- **Top Shelf** — publica itens recentes e álbuns na tela inicial do tvOS, com deep links de volta ao conteúdo
- **Interface multilíngue** — 16 idiomas, incluindo inglês, chinês simplificado e chinês tradicional

> Os caminhos de reprodução no Apple TV dependem do tipo de fonte, das credenciais disponíveis e da configuração de relay. O tvOS também inclui o caminho de compatibilidade via FFmpeg para formatos como WMA, DTS e TrueHD que o decodificador do sistema não reproduz nativamente.

## Apple Watch e integração com o sistema

- **Aplicativo complementar para Apple Watch** — exibe capa, informações da faixa, letra atual e progresso; permite reproduzir/pausar, avançar, retroceder, buscar e escolher uma faixa da fila ativa
- **Complicações do Watch** — mostram o estado atual da reprodução no mostrador e permitem voltar rapidamente ao aplicativo do Watch
- **Widgets da Tela de Início** — Reprodução Atual, Acesso Rápido, Letras, Estatísticas de Audição, Fontes de Música e Retrospectiva do Ano em vários tamanhos
- **Widgets da Central de Controle** — controles de reproduzir/pausar, aleatório, anterior e próxima no iOS
- **CarPlay** — navegue por recentes, playlists, álbuns e artistas e use a interface de Reprodução Atual do carro e controles de voz do sistema
- **Siri e Atalhos** — App Intents e media intents para reprodução, modo aleatório e navegação entre faixas
- **Spotlight** — indexa músicas, álbuns e artistas para que a busca do sistema possa abri-los diretamente
- **Experiência de reprodução do sistema** — controles de mídia na Tela Bloqueada e Central de Controle, controles de fone/Bluetooth, AirPlay, monitores externos e teclas de mídia

## Rádio, descoberta e personalização

- **Biblioteca de rádios pela internet** — adicione estações manualmente, importe listas M3U/PLS em lote ou assine uma URL de playlist e organize as estações com pastas, etiquetas e ordem personalizada
- **Logotipos e metadados ao vivo** — descubra automaticamente o logotipo e os metadados da programação atual ou informe uma URL de imagem; há suporte a logotipos SVG e estações sincronizadas por servidor
- **Descoberta inteligente** — alterne a tela inicial entre música e rádio, com recomendações inteligentes, escolhas por cena, itens ouvidos com frequência e gráficos visuais de audição
- **Serviços opcionais de inteligência** — configure provedores para busca semântica, recomendações, assistência de playlists e transcrição de áudio; credenciais específicas do dispositivo não são sincronizadas pelo CloudKit
- **Layouts editáveis** — reorganize seções, quantidade de itens e layouts diretamente na tela inicial, nos resultados de busca e no CarPlay, salvando presets personalizados
- **Aparência pessoal** — modos claro/escuro, cores derivadas da capa, temas, vários ícones adaptativos e um sistema visual de movimento consistente

## Fontes de música

| Categoria | Compatibilidade atual |
|----------|------------------------|
| NAS | Synology DSM, QNAP |
| Protocolos de arquivos | SMB/CIFS, WebDAV, FTP, SFTP, NFS, S3, UPnP/DLNA |
| Servidores de música | Subsonic, Navidrome, Airsonic, Gonic, Feiniu Music, DaoLiYu, Songloft, Synology Audio Station |
| Servidores de mídia | Jellyfin, Emby, Plex |
| Armazenamento em nuvem | 123 Cloud Drive, 115, Baidu Netdisk, Aliyun Drive, Google Drive, OneDrive, Dropbox, Drime, Guangya Cloud |
| Apple e local | importação de arquivos do iPhone/iPad, pastas locais no Mac, biblioteca e catálogo do Apple Music |

- **Conexão, escaneamento e navegação unificados** — informe um endereço de servidor e o Primuse verifica automaticamente porta utilizável, modo TLS e caminho; IDs Synology QuickConnect e Feiniu FN podem ser usados diretamente. Selecione pastas em fontes baseadas em arquivos ou escaneie uma biblioteca completa de servidor, com escaneamento em segundo plano, progresso retomável, atualizações incrementais e preenchimento posterior de metadados
- **Streaming e cache sob demanda** — fontes com suporte a Range reproduzem enquanto baixam, com limites configuráveis de cache, pré-aquecimento da fila e limpeza automática. Faixas em cache permanecem reproduzíveis quando uma fonte fica temporariamente offline, e downloads para uso offline mantêm também letras e capas
- **Qualidade por rede** — escolha a qualidade de transcodificação na rede móvel para Subsonic, Emby e Jellyfin; prefixos de proxy reverso, VPN, Tailscale e rotas IPv6 são tratados pelo roteamento de fontes
- **Credenciais seguras** — senhas e tokens OAuth ficam no Keychain; dados de fontes/contas e credenciais de reprodução são transferidos entre plataformas pelo iCloud ou por transferência segura em LAN quando compatível
- **Conexões confiáveis** — autorize explicitamente o host TLS ou HTTP do seu próprio NAS sem desativar a segurança de rede globalmente
- **Proteção de fontes somente leitura** — servidores da família Subsonic, Feiniu Music, DaoLiYu, UPnP e catálogos do Apple Music nunca excluem áudio remoto; dados obtidos por scraping permanecem no cache local
- **Sidecars graváveis** — fontes compatíveis com gravação podem armazenar capa e arquivos LRC ao lado do áudio; fontes sem suporte de escrita continuam somente leitura

UGREEN UGOS e as APIs legadas de arquivos no nível do sistema do fnOS ainda aguardam interfaces públicas e estáveis dos fabricantes e não são anunciados como fontes NAS compatíveis. Feiniu Music é uma integração separada e compatível de serviço de música, que não depende da API de arquivos do fnOS.

## Reprodução e formatos

- **Dois caminhos de decodificação** — um mecanismo nativo de alta fidelidade trata os formatos comuns, enquanto o caminho de compatibilidade via FFmpeg no iPhone, iPad, Mac e Apple TV cobre formatos que os decodificadores do sistema não tratam de forma confiável
- **Amplo suporte de formatos** — MP3, AAC/M4A, ALAC, FLAC, WAV/AIFF, APE, WavPack, OGG/Opus, WMA, TTA, TAK, Musepack, Shorten, Speex, QOA, DSF/DFF, AC-3, E-AC-3, MLP/TrueHD e outros
- **Divisão de faixas por CUE** — lê arquivos `.cue` em UTF-8, UTF-16 e GB18030 e usa entradas `INDEX 01` para expandir uma imagem contínua de álbum em faixas virtuais com títulos, números, limites de tempo e valores ReplayGain individuais
- **DTS e DTS-CD** — iPhone, iPad, Mac e Apple TV aceitam `.dts` / DTS-HD e detecção de DTS-CD baseada em conteúdo dentro de contêineres WAV por meio da decodificação de compatibilidade
- **DSD** — modos de reprodução Automático, PCM e DoP, selecionados conforme as capacidades do dispositivo e a preferência do usuário
- **Gapless e crossfade** — reprodução sem intervalos, crossfades de 1–12 segundos, remoção de silêncio no início/fim e pré-aquecimento da próxima faixa; quando o fade está ativado, mudanças manuais de faixa também usam uma transição curta
- **Ajustes de reprodução** — ReplayGain por faixa/álbum, velocidade de 0,5×–2,0× preservando o pitch, correspondência da taxa de amostragem de saída, temporizador de sono e pré-busca configurável da fila
- **Cadeia de efeitos** — equalizador de 10 bandas, Áudio Espacial e rastreamento de cabeça, compressão/limitação, reverberação e visualização em tempo real
- **Videoclipes** — detecta sidecars MP4/M4V/MOV com o mesmo nome ou trata um vídeo sem arquivo de áudio correspondente como videoclipe independente
- **Filas com fontes mistas** — faixas locais, NAS, nuvem, servidores e Apple Music permanecem visíveis na mesma fila, com o Primuse coordenando transições entre os diferentes provedores

## Letras e metadados

- **Dados incorporados e sidecars** — lê tags de áudio, capas incorporadas, capas com o mesmo nome/da pasta, letras sincronizadas ID3 SYLT, arquivos de letra `.lrc` / `.elrc` / `.lys` / `.yrc` / `.qrc` / `.vtt` / `.srt` e videoclipes com o mesmo nome
- **Letras sincronizadas por linha e palavra** — LRC padrão, temporização avançada por palavra, `offset`, duetos, linhas de harmonia, traduções e romanização, com toque para buscar, retomada automática do acompanhamento após navegação manual e exibição sincronizada no iOS, macOS, tvOS e Watch
- **Tradução offline de letras** — usa o framework Translation da Apple e armazena resultados localmente em cache, com idiomas de destino configuráveis e gerenciamento de cache
- **Edição e compartilhamento de letras** — edite letras, sincronize palavras individualmente, desloque toda a linha do tempo e salve em sidecar ou incorpore letras compatíveis ao arquivo de áudio; mantenha pressionada uma letra para criar pôsteres estáticos estilizados ou Live Photos e adicionar sua própria observação
- **Scrapers integrados** — Apple Music/iTunes Search, MusicBrainz e LRCLIB, cada um utilizado de acordo com seus recursos de metadados, capas ou letras
- **Classificação sensível à confiança** — classifica candidatos usando título, artista, álbum e duração; o scraping manual informa incerteza para reduzir correspondências incorretas entre itens de mesmo nome
- **Feedback de scraping em lote** — confirmação antes de iniciar, progresso ao vivo, cancelamento, estatísticas de conclusão e detalhes de falhas em tarefas longas de biblioteca
- **Fontes personalizadas de scraping** — importe JSON diretamente ou por HTTPS, com requisições GET/POST, cabeçalhos, cookies, limites de requisições, domínios TLS confiáveis, parsing em JavaScript e declarações de suporte a letras sincronizadas por palavra

## Biblioteca e sincronização

- **Biblioteca unificada** — navegue por música, álbum, artista, gênero, pasta e fonte, com álbuns de múltiplos discos, avaliações e resenhas, Pinyin, busca de texto completo em letras e condições compostas
- **Sistema de playlists** — playlists normais, playlists inteligentes, Favoritos Rápidos e importação/exportação M3U8 / JSON do Primuse; playlists podem ser reordenadas manualmente ou classificadas por nome, artista, data de adição e outros critérios, enquanto a importação oferece correspondência automática, correção manual e exportação em CSV de itens sem correspondência
- **Ferramentas de manutenção** — detecção de duplicados, proteção de fontes somente leitura, recuperação em Excluídos Recentemente, edição de tags e novo escaneamento por fonte
- **Estatísticas de audição** — recentes, contagem de reproduções, tendências de tempo ouvido, personalidade musical e Retrospectiva do Ano, também disponíveis em widgets
- **Scrobbling** — Last.fm e ListenBrainz, com suporte a novas tentativas em envios que falharam
- **Sincronização via CloudKit** — sincronize independentemente playlists, playlists inteligentes, fontes de música, contas de nuvem, configurações de scrapers, histórico de reprodução, estatísticas de audição e preferências
- **Transferência pela LAN e gerenciamento web** — envie faixas selecionadas ou cache offline entre dispositivos próximos e gerencie arquivos de transferência pelo navegador; a configuração do Apple TV usa transferências por QR Code em blocos com progresso visível
- **Compartilhamento familiar** — compartilhe playlists normais, playlists inteligentes e fontes de música da família via CloudKit, mantendo favoritos pessoais privados
- **Apple Music** — sincronize a biblioteca e playlists do usuário, adicione faixas pelo seletor do sistema e pesquise no catálogo do Apple Music; mostra a disponibilidade real de Lossless, Hi-Res Lossless e Dolby Atmos e refaz a correspondência de faixas quando a storefront muda. Conteúdo por assinatura é reproduzido via MusicKit, enquanto itens locais sem DRM confirmados como legíveis no Mac não exigem assinatura

## Requisitos

| Componente | Requisito mínimo |
|------------|------------------|
| Ferramentas de desenvolvimento | Xcode 26.0+, Swift 6.0+ e ambiente de desenvolvimento macOS |
| iPhone / iPad | iOS / iPadOS 18.0+ |
| Aplicativo para Mac | macOS 15.0+ |
| Apple TV | tvOS 17.0+ |
| Apple Watch | watchOS 10.0+ |

## Primeiros passos

### 1. Clone e abra o projeto

```bash
git clone git@github.com:chenqi92/primuse.git
cd primuse
open Primuse.xcodeproj
```

O Xcode resolve as dependências do Swift Package Manager na primeira abertura. Os XCFrameworks do FFmpeg já estão incluídos no repositório.

### 2. Configure a assinatura de código

1. Selecione o projeto **Primuse** no Xcode.
2. Defina seu Apple Developer Team nos targets do aplicativo e extensões que pretende compilar.
3. O app iOS, widgets, extensão de atividade, app do Watch, widgets do Watch, app macOS, app tvOS e extensão Top Shelf usam combinações diferentes de bundle e entitlements; recomenda-se manter a assinatura automática ativada.
4. Para usar o DLNA Renderer em um dispositivo físico, ative Multicast Networking para o App ID no portal Apple Developer e confirme que o perfil de provisionamento contém `com.apple.developer.networking.multicast`.

Também é possível alterar `DEVELOPMENT_TEAM` em `project.yml` e regenerar o projeto com XcodeGen.

### 3. Configure segredos locais (opcional)

```bash
cp Config/Secrets.local.xcconfig.example Config/Secrets.local.xcconfig
```

Adicione os valores de OAuth dos serviços de nuvem e do Last.fm conforme necessário. `Config/Secrets.local.xcconfig` é ignorado pelo Git. Se uma credencial OAuth integrada não estiver configurada, o serviço correspondente poderá exigir uma configuração de cliente própria do desenvolvedor.

### 4. Compile e teste

```bash
# Build genérico para o Simulador de iOS
xcodebuild -project Primuse.xcodeproj \
  -scheme Primuse \
  -destination 'generic/platform=iOS Simulator' \
  build

# Build para o Simulador do Apple TV
xcodebuild -project Primuse.xcodeproj \
  -scheme PrimuseTV \
  -destination 'generic/platform=tvOS Simulator' \
  build

# Testes do PrimuseKit
swift test --package-path PrimuseKit
```

### 5. Ferramenta auxiliar de desenvolvimento

O repositório inclui um utilitário local para os fluxos mais comuns de compilação, instalação e abertura:

```bash
# Escolher uma ação interativamente
scripts/primuse-dev.sh

# Listar iPhones e iPads disponíveis
scripts/primuse-dev.sh devices

# Instalar por cima mantendo os dados do app
scripts/primuse-dev.sh ios-overwrite

# Reinstalação limpa; o script exige a confirmação DELETE e apaga os dados do app
scripts/primuse-dev.sh ios-clean

# Compilar e abrir o app para Mac
scripts/primuse-dev.sh mac
```

Antes de compilar para um dispositivo físico, execute `scripts/check-apple-signing.sh` para verificar a identidade de assinatura, o acesso à chave privada e a autorização do `codesign`.

## Fontes personalizadas de scraping

O Primuse consegue descrever endpoints de pesquisa, detalhes, capas e letras em JSON e interpretar as respostas com JavaScript. Antes da importação, ele exibe para revisão os domínios, métodos HTTP, capacidades, cookies, domínios TLS confiáveis e avisos sobre configurações sensíveis.

### Exemplo de configuração

```json
{
  "id": "my-source",
  "name": "My Music Source",
  "version": 1,
  "icon": "music.note",
  "color": "#FF6600",
  "rateLimit": 500,
  "headers": {
    "User-Agent": "Primuse"
  },
  "capabilities": ["metadata", "cover", "lyrics", "lyricsWordLevel"],
  "search": {
    "url": "https://api.example.com/search",
    "method": "GET",
    "params": {
      "q": "{{query}}",
      "artist": "{{artist}}",
      "album": "{{album}}",
      "limit": "{{limit}}"
    },
    "script": "return (response.results || []).map(function (item) { return { id: String(item.id), title: item.title, artist: item.artist, album: item.album, durationMs: item.durationMs, coverUrl: item.coverUrl }; });"
  },
  "detail": {
    "url": "https://api.example.com/tracks/{{id}}",
    "method": "GET",
    "script": "return response;"
  },
  "cover": {
    "url": "https://api.example.com/tracks/{{id}}/covers",
    "method": "GET",
    "script": "return response.covers || [];"
  },
  "lyrics": {
    "url": "https://api.example.com/tracks/{{id}}/lyrics",
    "method": "GET",
    "script": "return { lrcContent: response.lrc, wordLevelLrc: response.wordLevelLrc, plainText: response.text };"
  }
}
```

### Contrato de importação e scripts

1. Abra **Ajustes → Scraping de metadados → Importar fonte de scraping**.
2. Cole o JSON ou uma URL HTTPS de manifesto.
3. Revise permissões e avisos de segurança e confirme a importação.
4. Reordene, ative, desative, edite ou configure cookies da fonte importada.

Os scripts podem acessar:

- `response`: resposta JSON interpretada
- `responseText`: texto bruto da resposta
- `externalId`: ID externo atual para endpoints de detalhes, capa e letras
- `log(msg)`: log de depuração

Valores de retorno esperados:

- `search`: `[{id, title, artist, album, year, durationMs, coverUrl, trackNumber, genres}]`
- `detail`: `{title, artist, albumArtist, album, year, trackNumber, discNumber, durationMs, genres, coverUrl}`
- `cover`: `[{coverUrl, thumbnailUrl}]`
- `lyrics`: `{lrcContent, wordLevelLrc, plainText}`

Não importe configurações de fontes em que você não confia. Scripts personalizados processam respostas remotas; cookies, cabeçalhos, domínios TLS confiáveis e segredos locais são permissões sensíveis.

## Estrutura do projeto

```text
primuse/
├── Primuse/                        # Código do app compartilhado por iOS e macOS
│   ├── App/                        # Entrada do app, injeção de dependências, cenas do CarPlay e tela externa
│   ├── Services/
│   │   ├── AI/                     # Provedores opcionais de inteligência, busca semântica e transcrição
│   │   ├── AppleMusic/             # Catálogo MusicKit, biblioteca e filas mistas
│   │   ├── Audio/                  # Reprodução, decodificação nativa/FFmpeg, cache e efeitos
│   │   ├── Cloud/                  # CloudKit, compartilhamento familiar, snapshots e sincronização de credenciais
│   │   ├── DLNA/                   # Renderizador UPnP/AV e transmissão
│   │   ├── Library/                # Biblioteca GRDB, escaneamento, Spotlight e manutenção
│   │   ├── Metadata/               # Tags, sidecars, scrapers e tradução de letras
│   │   ├── Radio/                  # Rádio pela internet, assinaturas, logotipos e metadados ao vivo
│   │   ├── Relay/                  # Relay LAN do iPhone para Apple TV
│   │   ├── Sources/                # Conectores NAS, protocolos, servidores e nuvem
│   │   ├── Transfer/               # Transferência pela LAN e gerenciamento de arquivos pelo navegador
│   │   └── Watch/                  # Ponte WatchConnectivity
│   ├── Views/                      # Interfaces iOS e macOS
│   └── Resources/                  # 16 localizações, assets e manifestos de privacidade
├── PrimuseKit/                     # Modelos, políticas e resolvedores de stream compartilhados por iOS/macOS/tvOS
├── PrimuseTV/                      # App para Apple TV
├── PrimuseTopShelf/                # Extensão Top Shelf do tvOS
├── PrimuseWatch/                   # App para Apple Watch
├── PrimuseWatchShared/             # Modelos compartilhados pelo app do Watch e complicações
├── PrimuseWatchWidgets/            # Complicações do Watch
├── PrimuseWidgetExtension/         # Widgets iOS/macOS e widgets da Central de Controle
├── Frameworks/FFmpeg/              # XCFrameworks do FFmpeg para iOS/macOS/tvOS
├── Config/                         # Entitlements, xcconfig e configuração Info
├── scripts/                        # Ferramentas de build, instalação, assinatura, FFmpeg e capturas
└── project.yml                     # Definição XcodeGen e fonte única da versão
```

## Dependências

| Pacote ou framework | Finalidade |
|---------------------|------------|
| [SFBAudioEngine](https://github.com/sbooth/SFBAudioEngine) | Decodificação de áudio de alta fidelidade e suporte a DSD |
| FFmpeg 8.1 (XCFrameworks dinâmicos incluídos) | DTS/DTS-CD, downmix multicanal e decodificação de compatibilidade |
| [GRDB.swift](https://github.com/groue/GRDB.swift) | Persistência da biblioteca em SQLite |
| [AMSMB2](https://github.com/amosavian/AMSMB2) | Cliente SMB/CIFS |
| [FileProvider](https://github.com/amosavian/FileProvider) | Operações de arquivos FTP e WebDAV |
| [Citadel](https://github.com/orlandos-nl/Citadel) | Cliente SSH/SFTP |
| [NFSKit](https://github.com/alexiscn/NFSKit) | Cliente NFS |
| [swift-crypto](https://github.com/apple/swift-crypto) | Operações criptográficas e de assinatura |
| [swift-nio](https://github.com/apple/swift-nio) | Infraestrutura de rede assíncrona |
| [SwiftDraw](https://github.com/swhitty/SwiftDraw) | Renderização de logotipos SVG de rádio e imagens vetoriais |

Os frameworks do sistema incluem MusicKit, CloudKit, AVFoundation, MediaPlayer, CarPlay, WidgetKit, WatchConnectivity, App Intents, Core Spotlight, Translation e Network.framework.

## Arquitetura

### Pipeline de áudio

```text
Local / NAS / protocolo / servidor de mídia / armazenamento em nuvem
  → SourceManager / StreamResolver / Range Fetcher
  → Segmentos CUE e políticas de cache/pré-aquecimento
  → NativeAudioDecoder (SFBAudioEngine) ou FFmpegAudioDecoder
  → AVAudioConverter
  → AVAudioEngine (Player → Mixer → EQ / Dynamics / Reverb → Output)

Apple Music
  → MusicKit ApplicationMusicPlayer
  → Coordenação do Primuse para fila mista e Reprodução Atual do sistema
```

### Metadados e letras

```text
Escaneamento da fonte
  → tags de arquivo + sidecars + expansão CUE
  → MetadataBackfillService
  → biblioteca GRDB e MetadataAssetStore

Scraping manual / automático / em lote
  → ScraperManager
  → scraper integrado ou scraper personalizado JSON + JavaScript
  → classificação de candidatos por título/artista/álbum/duração
  → cache local ou SidecarWriteService para fontes graváveis compatíveis
```

### Dados entre dispositivos

```text
iPhone / iPad / Mac
  ↔ CloudKit: playlists, fontes, ajustes, histórico, estatísticas, snapshots da biblioteca
  ↔ iCloud Keychain / pacote de credenciais criptografado
  ↔ Apple TV: sincronização CloudKit ou transferência por QR Code em LAN
  ↔ Apple Watch: estado de reprodução e comandos via WatchConnectivity
```

### CI/CD

- **Build** — o GitHub Actions aceita execuções manuais e também é acionado quando a versão de marketing ou o número de build muda, executando verificações de branding, resolução de dependências e um build do Simulador de iOS antes de gerar um artefato IPA não assinado
- **Notas de versão** — o workflow prepara e higieniza seções bilíngues do changelog preservando o conteúdo editorial já existente, faz commit da documentação e cria ou atualiza a GitHub Release correspondente

## Observações

O Primuse não fornece música nem armazenamento em nuvem. Você usa seus próprios arquivos, servidores e contas de terceiros. A disponibilidade depende de cada provedor, região, permissões da conta e estado das APIs. Respeite os termos das fontes de conteúdo e toda a legislação aplicável.
