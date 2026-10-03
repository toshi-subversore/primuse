<p align="right"><a href="MacDesignAudit.md">Original</a> · <strong>Português (Brasil)</strong></p>

# Auditoria de design do Primuse no macOS

Fonte de verdade: `design/猿音/main.jsx` e `design/猿音/scenes/*.jsx`.
Escopo: apenas macOS. Os artboards de tvOS ficam deliberadamente fora do escopo desta auditoria.

## Janela principal

| Artboard de design | Implementação | Status | Observações |
| --- | --- | --- | --- |
| `home` / HOME-01..11 | `Primuse/Views/Mac/MacHomeView.swift` | Implementado | Seções do dashboard, saúde das fontes, pipeline e conteúdo recente usam as cores PM. |
| `library-songs` / LIB-01 | `Primuse/Views/Library/SongListView.swift` | Implementado | Lista em estilo de tabela existe no macOS; continuar validando espaçamento do cabeçalho/tabela no QA visual. |
| `library-albums` / LIB-02 | `AlbumGridView.swift`, `AlbumDetailView.swift` | Implementado | Grid e detalhe usam cabeçalho e cartões próprios do macOS. |
| `library-artists` / LIB-03 | `ArtistListView.swift`, `ArtistDetailView.swift` | Implementado | Lista e detalhe de artistas usam superfícies PM. |
| `library-playlist` / LIB-04/05 | `PlaylistListView.swift`, `PlaylistDetailView.swift`, `SmartPlaylistDetailView.swift`, `SmartPlaylistEditorView.swift` | Implementado | Editor de playlist inteligente e folha de reordenação usam painéis PM no macOS. |
| `search` / S-01..05 | `Primuse/Views/Search/SearchView.swift` | Implementado | Rota de busca e resultados agrupados usam o shell/campo de busca PM. |
| Shell do app / titlebar/sidebar/barra inferior | `MacContentView.swift`, `PMTitleBar.swift`, `MacSidebar.swift`, `MacBottomBar.swift` | Implementado | Titlebar, reset de rota, sidebar e controles inferiores são personalizados; continuar revisão visual do espaçamento superior. |

## Reprodução atual

| Artboard de design | Implementação | Status | Observações |
| --- | --- | --- | --- |
| NP-Bar | `MacBottomBar.swift` | Implementado | Transporte inferior, scrubber, fila, saída, cast e botões de mini player/tela cheia. |
| `np-now` | `MacNowPlayingView.swift` | Implementado | Player deslizante na janela principal com letras grandes. |
| `np-fullscreen` | `PrimuseApp.swift` + `MacNowPlayingView.swift` | Implementado | Comando de tela cheia expande o Now Playing. |
| `np-external` | `ExternalDisplayNowPlayingView.swift` | Implementado | Rótulo de segunda tela, capa grande, fundo ambiente e pilha de letras grandes correspondem a `fullscreen.jsx`. |

## Janelas flutuantes

| Artboard | Implementação | Status | Observações |
| --- | --- | --- | --- |
| `mp-collapsed` | `MiniPlayerWindowController.swift`, `MacMiniPlayerView.swift` | Implementado | Mini player em NSPanel. |
| `mp-lyrics` | `MacMiniPlayerView.swift` | Implementado | Aba expandida de letras. |
| `mp-queue` | `MacMiniPlayerView.swift` | Implementado | Aba expandida de fila. |
| `menubar` | `MacMenuBarController.swift`, `MenuBarPlayerView.swift` | Implementado | Popover da barra de menus. |
| `dl-double` | `DesktopLyricsWindowController.swift`, `DesktopLyricsView.swift` | Implementado | Letras de desktop em duas linhas. |
| `dl-single` | `DesktopLyricsView.swift` | Implementado | Modo de uma linha. |
| `dl-vertical` | `DesktopLyricsView.swift` | Implementado | Modo vertical. |
| `dl-locked` | `DesktopLyricsView.swift`, comandos do app | Implementado | Bloqueio/desbloqueio e modo click-through. |

## Fontes

| Artboard | Implementação | Status | Observações |
| --- | --- | --- | --- |
| `sources-main` / SRC-23/24/25/28 | `MacSourcesView.swift` | Implementado | Visão geral de fontes usa cartões PM. |
| `sources-add` / SRC-01 | `SourceTypeSelectionView.swift`, `AddSourceView.swift` | Implementado | Sheet de nova fonte com estilo macOS. |
| `sources-browse` / SRC-21 | `BrowserChrome.swift` e navegadores de fontes | Implementado | Chrome do navegador presente; linhas específicas por protocolo precisam de verificações pontuais. |
| `sources-oauth` / SRC-16/22 | `MacOAuthBridge`, `AddSourceView.swift` | Implementado | OAuth no macOS retorna pelo esquema de URL. |

## Ajustes

| Artboard | Implementação | Status | Observações |
| --- | --- | --- | --- |
| `set-playback` / ST-01 | `MacSettingsView.swift` / `MacSTPlaybackView` | Implementado | Cena de Ajustes própria, sem Form do sistema. |
| `set-eq` / ST-02 | `MacSTEqualizerView` | Implementado | EQ de 10 bandas e chips de presets. |
| `set-fx` / ST-03 | `MacSTEffectsView` | Implementado | Linhas da cadeia de efeitos. |
| `set-scrape` / ST-04 | `MacSTScrapingView` | Implementado | Configuração real de scrapers, ordem, importação e ações em lote. |
| `set-lyrics` / ST-05 | `MacSTLyricsView` | Implementado | Tradução e exibição de letras. |
| `set-apple` / ST-06 | `MacSTAppleMusicView` | Implementado | Conta e sincronização da biblioteca. |
| `set-widget` / ST-07 | `MacSTWidgetView` | Implementado | Catálogo e previews de widgets. |
| `set-cloud` / ST-08 | `MacSTCloudView` | Implementado | Estado real do CloudKit e ações de compartilhamento familiar. |
| `set-theme` / ST-12 | `MacSTThemeView` | Implementado | Aparência, cor de destaque, ícone e materiais. |
| `set-deleted` / ST-09 | `MacSTDeletedView` | Implementado | Linhas PM de itens excluídos recentemente. |
| `set-ssl` / ST-10 | `MacSTSSLView` | Implementado | Sheet para adicionar/remover domínios confiáveis. |
| `set-about` / ST-11 | `MacSTAboutView` | Implementado | Sobre, versão e licenças. |

## Estatísticas

| Artboard | Implementação | Status | Observações |
| --- | --- | --- | --- |
| `stats-main` | `ListeningStatsView.swift` | Implementado | Cartões macOS, chips de período, heatmap e ranking. |
| `yearly` | `YearlyReportView.swift` | Implementado | macOS usa a faixa larga de stories de `yearly.jsx`; o pager de stories do iOS permanece separado. |

## Utilitários

| Artboard | Implementação | Status | Observações |
| --- | --- | --- | --- |
| `scrape` / META-07 | `ScrapeWindowController.swift`, `ScrapeOptionsView.swift` | Implementado | Janela independente no macOS; formulários avançados internos precisam de checagens pontuais. |
| `queue-panel` / P-11/13 | `MacQueuePanel.swift` | Implementado | Painel lateral personalizado. |
| `more-menu` | `PlayerMoreMenu.swift` | Implementado | Popover PM inclui editor de tags, músicas similares, sleep timer, links de álbum/artista, rota de scrobble e ajustes de reprodução. |
| `add-playlist` / P-27 | `NowPlayingView.swift` / `AddToPlaylistSheet` | Implementado | Sheet específico de macOS. |
| `output-picker` / P-21 | `AudioOutputPickerView.swift` | Implementado | Popover personalizado. |
| `dlna-cast` / CAST-01 | `NowPlayingView.swift` / `CastDevicePickerSheet` | Implementado | macOS usa painel PM CAST-01 em vez de List/NavigationStack. |
| `sleep-timer` / P-14 | `PlayerMoreMenu.swift`, `NowPlayingView.swift` | Implementado | Menu Mais usa popover PM em vez de confirmação. |
| `song-info` / P-29 | `NowPlayingView.swift` / `SongInfoSheet` | Implementado | Sheet de informações específico do macOS. |
| `tag-editor` / LIB-08 | `TagEditorView.swift` | Implementado | Painel de edição de tags. |
| `playlist-import` / PL-06 | `PlaylistImportView.swift` | Implementado | Painel de importação. |
| `scrobble` / SCROB-* | `ScrobbleSettingsView.swift` | Implementado | Painel macOS. |
| Reordenação de playlist | `PlaylistDetailView.swift` / `PlaylistReorderSheet` | Implementado | Utilitário ativo usa painel PM com controles explícitos de movimentação. |

## Widgets

| Artboard | Implementação | Status | Observações |
| --- | --- | --- | --- |
| `widget-gallery` | `MacSettingsView.swift` / `MacSTWidgetView`, extensão Widget | Implementado | ST-07 mostra previews reais small/medium/large; Now Playing e QuickAccess continuam sendo as superfícies WidgetKit efetivamente entregues. |
| `widget-desktop` | `MacSettingsView.swift` / `MacSTWidgetView`, extensão Widget | Implementado | O contexto de widget no desktop é representado por previews em tamanho real e controles de sincronização WidgetKit. |

## Onboarding

| Artboard | Implementação | Status | Observações |
| --- | --- | --- | --- |
| `onb-1` | `OnboardingView.swift` | Implementado | macOS usa a página de boas-vindas dark glass de `onboarding.jsx`. |
| `onb-2` | `OnboardingView.swift` | Implementado | Visão geral de protocolos usa cartões PM de vidro em duas colunas. |
| `onb-3` | `OnboardingView.swift`, `AddSourceView.swift` | Implementado | Preview da primeira fonte e conclusão são específicos do macOS. |

## Fila atual de correções

1. Refazer QA visual com screenshots claros/escuros atualizados, focando continuidade de cor entre titlebar, sidebar e barra inferior.
2. Manter explícito o escopo da extensão WidgetKit: ST-07 mostra todos os variants do design, enquanto a extensão distribuída atualmente expõe Now Playing e QuickAccess.
