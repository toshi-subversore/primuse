<p align="right"><a href="CHANGELOG.en.md">English</a> · <a href="CHANGELOG.md">中文</a> · <strong>Português (Brasil)</strong></p>

# Changelog

---

## [1.10.1] (builds 82–85) — 26/09/2026

Esta versão adiciona karaokê, audiobooks e medleys de música, amplia o suporte a formatos de áudio/vídeo e importação de playlists, adapta todo o app ao iPhone Duo e melhora a confiabilidade da Home, do Apple TV e da reprodução.

### Adicionado

- **Modo Karaokê** — reduza os vocais, altere o tom, separe partes de duetos e use o microfone para pontuar e gravar sua performance; a separação vocal por IA baixa o modelo quando ativada e remove a voz original com mais precisão; o vocal-guia entra quando você para de cantar; o modo de prática repete linhas individuais e reduz a velocidade sem alterar o pitch; versões instrumentais existentes na biblioteca são encontradas automaticamente e reutilizam as letras da versão original
- **Karaokê no Apple TV** — cante na TV usando um iPhone pareado por QR Code como microfone para pontuação, utilize vocais separados por IA no iPhone, altere o tom e divida partes de duetos
- **Audiobooks** — estante agrupada por obra e player dedicado com capítulos, marcadores, velocidade e sleep timer nas três plataformas; o scrubber permite navegar em listas longas de capítulos e os livros podem ser reordenados por arrastar; CarPlay e widgets oferecem suporte a audiobooks, incluindo o novo widget Continuar Ouvindo; no Apple TV há marcadores de capítulos e controle de velocidade em todos os formatos
- **Medleys de música** — inicie um medley em uma única ação pelo menu do player; o próximo segmento é preparado antes da transição e músicas não reproduzíveis são ignoradas; iniciar usando rede celular exibe aviso de uso de dados, e o aviso pode ser reativado nos Ajustes
- **Importação de playlists** — importe links do NetEase Cloud Music, QQ Music, Kuwo, Kugou, Migu, Bodian, Soda Music, Apple Music, Spotify, Deezer, bilibili e YouTube, além de listas de texto, CSV e arquivos Apple Music txt/xml, pls, xspf e wpl; músicas ainda ausentes na biblioteca aparecem em cinza e são ativadas quando chegam
- **Mais formatos de áudio e vídeo** — MKA, WebM, MP2, Wave64, RF64, RealAudio e módulos tracker como MOD, XM, IT e S3M; videoclipes em MKV, WebM, AVI, FLV, WMV, TS, MPG e RMVB são convertidos e armazenados em cache na primeira reprodução, com progresso e motivos de falha
- **Sugestões de tags e edição em lote** — o editor de tags sugere correções, pode verificar a biblioteca inteira de uma vez e editar várias músicas juntas; dicas inteligentes aparecem durante a reprodução quando relevantes
- **Presets de serviços de IA** — adicionados SenseNova e Agnes AI, incluindo Agnes AI China (#157)

### Alterado

- **Home** — filtre a tela inicial por Música, Rádio ou Conteúdo Falado; a edição da Home agora inclui Continuar Ouvindo, rádio, livros em andamento e audiobooks, incluindo quais estações e livros aparecem e em qual ordem; no Mac, a estante também pode ser exibida na Home
- **iPhone Duo** — telas interna e externa, uso horizontal, meia dobra em modo mesa e barra lateral do sistema têm suporte completo: Home e páginas de detalhe em duas colunas, player dividido, controles e Próximos na metade inferior quando semi-dobrado, além de elementos que animam para a nova posição ao dobrar ou girar
- **Conteúdo falado separado** — audiobooks e música não se misturam mais; capítulos de conteúdo falado encontrados na busca são reproduzidos isoladamente e as posições de audição são salvas imediatamente, inclusive quando o app do Mac é encerrado
- **Letras na mesa no Mac** — abrem inicialmente logo acima do Dock; com o painel de fundo oculto, passar o mouse sobre as letras ainda revela a barra de ferramentas (#149 #156)
- **Reprodução em tela cheia** — o texto do palco desaparece no modo de descanso em vez de sobrepor relógio e letras (#154); traduções aparecem sem precisar sair e entrar novamente
- **Letras bilíngues** — linhas contendo apenas guia fonético ou outros idiomas continuam sendo traduzidas; romaji, pinyin e coreano romanizado deixam de ser tratados como traduções
- **Feiniu Music** — letras priorizam candidatos interpretáveis e mantêm o offset calibrado pelo servidor no iPhone, Mac e Apple TV; write-back de tags pode renomear álbuns, criar novos gêneros e enviar capas; índices de playlists são lidos em uma única passagem
- **ReplayGain** — o volume não salta mais quando combinado com crossfade, reprodução gapless, fades de pausa ou equalizador
- **Rádio por HTTP sem TLS** — estações em hosts ainda não autorizados perguntam se o usuário deseja confiar neles e começam a tocar imediatamente após a autorização
- **Escaneamento de fontes** — Emby/Jellyfin e outras fontes de servidor não falham mais quando músicas são adicionadas ou removidas durante o scan; fontes verificadas usam uma rota alcançável ao escolher pastas; o seletor de pastas foi redesenhado e pastas podem ser marcadas como Conteúdo Falado
- **Notificações do sistema** — são enviadas apenas quando uma tarefa iniciada por você termina enquanto o app está fora de foco

### Corrigido

- **Reprodução** — corrigida a pausa antes do áudio ao usar aleatório ou Reproduzir Tudo, e o botão de play da Central de Controle/Tela Bloqueada que levava cerca de dez segundos para atualizar após pausar (#159)
- **Karaokê** — corrigidos possível crash ao trocar de música, crashes ao arrastar o controle de vocais ou mudar o tom, vocais residuais após seek e gravações que terminavam imediatamente quando iniciadas durante pausa
- **Conexões remotas** — breves quedas de rede ao acessar um NAS externamente não interrompem mais a reprodução nem marcam toda a fonte como indisponível
- **Tags** — corrigidos números de faixa/disco ilegíveis em M4A, write-back sobrescrevendo campos inalterados e sufixo “(1)” de downloader transformando títulos em nomes de artista
- **Interface** — corrigidos Home ocasionalmente presa no placeholder de carregamento após cold launch, gráfico de audição alargando a Home em layouts estreitos de iPad, crashes quando o sistema recusa rotação e diálogos/painéis de ajuste cortados em telas baixas
- **Verificação de atualização** — novas versões voltam a ser detectadas e a verificação manual abre diretamente o cartão de atualização
- **Apple TV** — corrigidos persistência da verificação Synology, capa de livros que não carregava e navegação de foco lenta em bibliotecas grandes
- **Texto** — botões chineses Voltar e Próximo não aparecem mais como Imagem Anterior e Próxima Imagem; dicas de gerenciamento de rádio agora correspondem aos controles reais

### Desempenho

- **Player** — abrir e fechar o player por gesto não causa mais engasgos; menu Mais e dicas inteligentes deixam de expandir toda a fila
- **Home e biblioteca** — rolagem da Home fica suave após cold launch e a biblioteca carrega mais rápido

---

## [1.9.8] (builds 78–82) — 21/09/2026

Esta versão redesenha interações importantes de busca e do player imersivo, adiciona conteúdo falado e gerenciamento de rádio no Apple TV, amplia Apple Music, conexões de fontes, sincronização pelo iCloud e diagnósticos de inicialização, além de corrigir reprodução em tela cheia no Mac, letras na mesa e vários problemas de playback.

### Adicionado

- **Resultados de busca editáveis** — reordene ou oculte seções de músicas, álbuns, artistas e outros resultados; no Mac, as seções ficam lado a lado, e abrir Busca foca o campo imediatamente (#145)
- **Seletor do sistema para Apple Music** — adicione músicas pelo seletor do sistema, abra o fluxo de assinatura quando necessário e refaça automaticamente a correspondência após mudança de storefront
- **Detalhes reais de qualidade no Apple Music** — mostra disponibilidade efetiva de Lossless, Hi-Res Lossless e Dolby Atmos em vez de classificar todas as faixas como AAC
- **Recuperação e diagnóstico de inicialização** — informa a etapa em que a inicialização parou e entra em modo seguro após falhas repetidas; relatórios agora incluem motivos de encerramento do sistema e candidatos de conexão
- **Fundos dinâmicos nas páginas de detalhe** — álbum, artista e gênero usam uma tonalidade de página inteira derivada da capa
- **Conteúdo falado** — suporte a audiobooks, programas de conversa e outros conteúdos falados; arquivos M4B são reproduzidos diretamente
- **Gerenciamento de rádio no Apple TV** — adicione, exclua, reordene e renomeie estações e navegue pela biblioteca na TV; estações aparecem no Top Shelf; logotipos suportam SVG e estações oriundas de fontes de música (#151)
- **Servidores de letras personalizados** — scraping pode usar uma API de letras fornecida pelo usuário e buscar letras automaticamente quando nenhuma é encontrada
- **Manter tela ligada** — o player pode manter a tela ativa, com opção nos Ajustes do Player (#154)
- **Verificação de saúde das fontes** — mostra progresso item por item e testa todas as rotas de conexão
- **Ícone NonoEnd** — novo ícone alternativo com clave de fá; Soft Note passa a ser o ícone padrão

### Alterado

- **Endereços das fontes** — informe diretamente um Synology QuickConnect ID ou Feiniu FN ID; o Primuse resolve porta, modo TLS e caminho utilizável; uma fonte pública editável pode ser salva sempre que o endereço alternativo funcionar
- **Sincronização de playlists do servidor** — playlists recém-criadas no servidor sincronizam automaticamente, sem aguardar scan manual (#142)
- **Agendamento de leitura de tags** — faixas novas recebem tags antes das revisões da biblioteca inteira; leituras WebDAV/NAS são mais rápidas e plataformas desktop usam o nível mais rápido compatível com o dispositivo
- **Gaveta de efeitos imersivos** — toque fora da gaveta para fechá-la no iPhone; no Mac há uma gaveta de preview à direita com transições de tela cheia e restauração de janela mais confiáveis
- **Interação com letras na mesa** — com o painel de fundo oculto ou bloqueado, áreas fora das letras deixam cliques passarem para a janela atrás, e o painel se adapta ao tamanho da tela (#149)
- **Roteamento remoto** — handshakes LAN travados ou falhos passam para o endereço público em vez de aguardar todo o timeout; fontes de servidor reconfirmam a rota após mudança de rede; health check não considera um handshake de proxy como prova de alcance
- **Sincronização pelo iCloud** — merge de playlists em três vias, estações excluídas não voltam e playlists muito grandes sincronizam; ativar sync de ajustes não sobrescreve outros dispositivos; opções específicas de hardware/storage ficam locais e credenciais exclusivas do dispositivo não migram mais para iCloud Keychain
- **Snapshots da biblioteca no Apple TV** — registrados por dispositivo de origem e mesclados por música; bibliotecas enviadas pela rede local não são sobrescritas por cópias antigas da nuvem e edições de estações feitas na TV são preservadas
- **Efeitos de tela cheia** — Light Rhythm e Live Waveform foram removidos; espectro radial fica centralizado em paisagem e canvases largos
- **Próximos no CarPlay** — exibe capas e segue a ordem real de reprodução
- **Pedidos de música pela Siri** — títulos são reconhecidos com maior confiabilidade e a Siri explica o motivo quando nada é encontrado
- **Entradas de feedback** — Sobre agora possui links separados para “Reportar um problema” e “Solicitar recurso”, abrindo formulário com versão, modelo do dispositivo e SO já preenchidos e editáveis; apenas a descrição é obrigatória

### Corrigido

- **Estado do Apple Music no sistema** — corrigidos Tela Bloqueada/CarPlay mantendo a faixa anterior após mudança automática e problemas de recuperação, retry e troca de storefront
- **Tela cheia no Mac** — corrigidos painel de efeitos desabilitado, controles superiores saindo dos limites ou tremendo, janelas retornando fora da tela e player não acompanhando o tamanho do container
- **Busca e ícones no Mac** — corrigidas contagens antigas após limpar busca, ícone antigo piscando no Dock durante abertura e restauração incorreta do ícone padrão (#145 #146)
- **Agrupamento de álbuns** — faixas do mesmo álbum não são mais separadas por artista da faixa; álbuns multidisco mantêm ordem de disco e faixa
- **Feedback de conexão e inicialização** — conexões deixam de girar indefinidamente em caso de erro; setup de fontes e startup informam causas acionáveis; endereços e caminhos de servidor são redigidos dos logs
- **Edição de letras** — verificações de permissão de escrita deixam de travar; editar M4A com metadata de grouping preserva letras incorporadas
- **Pressão de memória** — caches de capas são liberados primeiro quando há pouca memória, reduzindo a chance de encerramento pelo sistema
- **Falsos positivos do modo seguro** — inicializações feitas pelo sistema em background, como retomada de scan ou silent push, deixam de contar como inicialização abortada e não podem mais prender o app em modo seguro; modo seguro travado incorretamente é limpo após atualização
- **Sync de playlists/favoritos Feiniu** — listas vazias do servidor não falham mais com “not valid Feiniu Music JSON”; índices de playlists sem paginação são lidos corretamente
- **Reprodução** — corrigidos rádio sem tocar no Apple TV, reprodução parando após uma música com crossfade e algumas faixas sem duração legível sendo relidas indefinidamente e deixando a interface lenta
- **Destaque de letras** — corrigido texto original sem destaque em letras com idiomas mistos, como coreano com inglês
- **Fontes de música** — corrigidas falhas por opção de protocolo dessincronizada do endereço, edição/reautenticação de senha Synology, músicas permanecendo após desmarcar pasta e write-back de tags do 123 Cloud relatando falha enquanto o servidor ainda fazia merge
- **Interface** — corrigido crash em “Ver tudo” de pastas da Home, antigo player em duas colunas em modo paisagem nos modelos Plus/Pro Max e engasgos durante scan ou edição de uma fonte

### Desempenho

- **Fontes e Home** — leituras de tags WebDAV/NAS mais rápidas, bibliotecas grandes de rádio mais suaves e troca mais responsiva entre Música e Rádio na Home
- **Privacidade dos diagnósticos** — candidatos de conexão e etapas de falha continuam úteis para troubleshooting, enquanto endereços, caminhos e outros valores sensíveis são substituídos por marcadores estáveis

---

## [1.9.7] (builds 73–77) — 19/09/2026

Esta versão adiciona Guangya Cloud, Synology Audio Station, organização completa de rádios e novos formatos de letras, incorpora Apple Music à lista unificada de fontes e reformula layouts em paisagem, decodificação no Apple TV, sincronização com servidores e transferência entre dispositivos.

### Adicionado

- **Fonte Guangya Cloud** — adicione Guangya Cloud como fonte de música, com scan e reprodução como qualquer outra
- **Compartilhamento de pôster de letras** — transforme letras selecionadas em uma imagem compartilhável com layout e cores ajustáveis
- **Navegação por pastas em serviços de nuvem** — hierarquia de pastas é reconstruída e fontes ganham uma entrada de pastas para navegar na estrutura original (#109)
- **Ordenação manual de playlists** — mantenha uma faixa pressionada e arraste para uma nova posição
- **Atalho de aleatório** — botão Shuffle disponível no topo da lista de músicas e da fila (#115)
- **Exportação de log de diagnóstico** — builds TestFlight podem exportar logs em Gerenciamento de Armazenamento
- **Pastas, tags e assinaturas de rádio** — organize estações com pastas/tags, importe playlists agrupadas, assine URLs de playlist, informe URLs de imagem e exiba logos SVG (#118 #119)
- **Synology Audio Station** — suporte no iPhone, iPad, Mac e Apple TV com músicas, playlists, favoritos e estações SHOUTcast sincronizadas
- **Mais formatos de letras sincronizadas** — ID3 SYLT, `.elrc`, `.lys`, `.yrc`, `.qrc`, `.vtt` e `.srt`, preservando `offset`, dueto, harmonia, tradução e romanização (#125 #128 #129 #130 #131)
- **Incorporar letras no áudio** — salve letras sincronizadas editadas somente dentro do arquivo ou junto de um sidecar, com aviso de escrita antes de ativar
- **Qualidade adaptada à rede** — Subsonic, Emby e Jellyfin podem usar qualidade transcodificada em redes móveis e suportam prefixos de caminho de proxy reverso (#126 #135)
- **Novos ícones e movimento de interface** — novos temas de ícones adaptativos e sistema consistente de animação em navegação, cartões, listas, capas e controles

### Alterado

- **Apple Music na lista de fontes** — autorização, sincronização de biblioteca e remoção acontecem na lista de fontes; Apple Music pode ser adicionado/removido como qualquer fonte e, após remoção, seu conteúdo deixa de aparecer na busca (#112)
- **Scan continua fora do app** — um scan continua executando após sair do app e retoma de onde parou ao retornar (#99)
- **Sincronização de exclusões do servidor** — faixas removidas no servidor são removidas localmente; fontes sem suporte a exclusão passam a remover apenas o registro local (#107 #103 #95)
- **Backoff de leitura de tags** — leitura desacelera automaticamente quando servidor retorna 5xx; requisições/respostas WebDAV são registradas para diagnóstico
- **Cores dos ícones de fontes** — cada fonte usa a própria cor de marca
- **Layout de transferência entre dispositivos** — ação principal foi movida para a barra de navegação, abrindo mais espaço para a lista
- **Anotações e traduções de letras** — anotações e traduções ficam junto da linha original; linhas estrangeiras em músicas multilíngues voltam a ser destacadas
- **Layouts em paisagem no iPhone** — Home, Now Playing, letras, detalhes, grids e painéis de ajustes se adaptam à altura; rotação e transições de dobráveis preservam a página atual
- **Decodificação de compatibilidade no Apple TV** — tvOS ganha FFmpeg para WMA, DTS, TrueHD e outros formatos não suportados nativamente
- **Sincronização incremental de servidores** — servidores de mídia e família Subsonic enviam catálogos grandes progressivamente, retomam após interrupção e sincronizam tags, capas, avaliações e exclusões
- **Cache offline completo** — downloads offline incluem letras e capas do servidor; faixas em cache continuam tocando quando a fonte está temporariamente indisponível
- **Transferência fragmentada para Apple TV** — snapshots grandes são transferidos em etapas com progresso visível, reduzindo automaticamente capas anexadas se o payload excederia o limite
- **iCloud mais eficiente** — lotes grandes de playlists/bibliotecas deixam de reescrever registros inteiros um a um; upgrades/restaurações evitam reuploads completos desnecessários

### Corrigido

- **Capas incorporadas** — corrigidas capas que não podiam ser lidas em algumas faixas após importação em lote e depois nunca eram recuperadas (#116)
- **Conexões externas/remotas** — corrigidas conexões de fontes externas falhando e derrubando o app, além de conexões remotas fnOS e tratamento de erros
- **IPv6** — endereços IPv6 voltam a conectar e diretórios carregam corretamente
- **Reordenação da fila** — corrigido crash ao arrastar; com shuffle ativo, mudanças automáticas agora seguem a mesma ordem de Reproduzir a seguir após reordenação (#108)
- **Layout de pôster de letras** — previews em branco e layouts cortados corrigidos
- **Edição de favoritos rápidos** — abertura e digitação deixam de ficar lentas
- **Velocidade de reprodução** — controle volta a abrir
- **Botões de janela no macOS** — botões no canto superior esquerdo deixam de piscar ao rolar
- **Estabilidade da reprodução** — corrigidos crashes ocasionais no início, áudio antigo após retomar/trocar faixa, repetição de faixa remota esperando download completo e pulos manuais sem o fade configurado
- **Recuperação de fontes** — corrigidos fontes públicas marcadas offline, pastas WebDAV por proxy reverso sem carregar, crashes por timeout SMB e faixas locais/remotas removidas e reimportadas incapazes de retornar (#111 #134)
- **Capas e pôsteres** — capas podem ser reconstruídas após limpar cache; pôsteres voltam a salvar em Fotos e efeitos de movimento ficam disponíveis em todos os estilos
- **Apple TV e iCloud** — corrigidos painéis sobrepostos de ajustes inteligentes, iCloud atualizando apenas uma vez ou trocando dados após ser desativado e ausência de detalhes em falhas de sync (#123)

### Desempenho

- **Catálogos grandes de servidor** — servidores de mídia e Plex usam staging paginado e scans retomáveis para que grandes bibliotecas não fiquem mais lentas durante o scan
- **Rádio e biblioteca** — otimização de coleções grandes de estações e troca da Home, reduzindo recomputações repetidas de views
- **Tamanho do app e memória** — redução de assets da Retrospectiva do Ano e previews de ícones, compartilhamento da camada de banco entre app/widgets e eliminação de saves completos repetidos durante startup, playback e backfill

---

## [1.9.6] (builds 68–72) — 13/09/2026

Esta versão permite adicionar quase todo tipo de fonte diretamente no Apple TV e reproduzir Apple Music, adiciona edição visual da Home e CarPlay, reformula os visuais imersivos e trata sistematicamente scan de bibliotecas grandes, aquecimento por leitura de tags e vários problemas de concorrência.

### Adicionado

- **Fontes no Apple TV** — adicione e escaneie Synology, QNAP, UGREEN, WebDAV, FTP, SFTP, NFS, storage S3, UPnP e todos os serviços de nuvem diretamente no Apple TV; serviços de nuvem passam a autenticar por QR Code; Jellyfin, Emby, Plex e servidores da família Subsonic também são suportados, com erros, verificação em duas etapas e confiança em certificado autoassinado
- **Apple Music no Apple TV** — reprodução direta, busca no catálogo, álbuns e artistas, playlists do Apple Music na aba de playlists e autorização pela busca ou ajustes
- **Edição da interface no próprio lugar** — organize a interface na tela real, reordene seções da Home e ajuste quantidade de itens/linhas; opções visuais ficam agrupadas por tela
- **Edição do layout do CarPlay** — edite visualmente o CarPlay, salve presets, personalize menu principal e use grupos de ajustes e drag-and-drop reconstruídos
- **Reformulação dos visuais imersivos** — estilos reconstruídos com cinco novas cenas; espectro volta a existir em passthrough de alta fidelidade
- **Avaliações e resenhas** — avalie e escreva reviews pela biblioteca, com melhorias nos gráficos de audição
- **Logos e metadados de rádio ao vivo** — fontes de logos são resolvidas automaticamente com metadata durante playback; logos aparecem ao adicionar estações em lote e também podem ser buscados manualmente
- **Sync de playlists/favoritos do servidor** — fnOS, Songloft, Jellyfin e Plex passam a sincronizar playlists e favoritos no servidor
- **Roteamento VPN e Tailscale** — roteamento considera VPN/Tailscale e corrige IPv6; adicionar endereço público a uma fonte preserva playback e cache offline existentes
- **Redirecionamentos STRM** — suporte a redirects de media server STRM e retries melhores no cache remoto
- **Alinhamento de letras na música inteira** — temporização pode ser alinhada na faixa completa, com conflitos marcados
- **Sleep timer** — player de rádio ganha temporizador
- **Marchas de leitura de tags** — velocidade selecionada permanece após aquecimento do dispositivo e foi adicionada uma marcha de pausa
- **Detalhes da checagem de tags** — tela redesenhada com cartões consistentes e barra de distribuição de status
- **Enviar diagnóstico por e-mail** — relatório pode ser enviado ao desenvolvedor diretamente pela tela
- **Exclusão restrita em WebDAV** — se o servidor não permitir apagar, apenas o registro local é removido

### Alterado

- **Nome do produto** — o nome passa a ser Primuse em todos os lugares; 猿音 permanece como alias invocável
- **Ritmo de leitura de tags** — modo máximo exibe aviso de risco, playback recebe uma vaga adicional de leitura e throughput medido é registrado junto dos limites; tempo de background encerrado pelo sistema não é mais tratado como falha; reler todas as tags executa diretamente, enquanto releituras por fonte passam para menu de pressão longa
- **Startup e scan de bibliotecas grandes** — inicialização e índice de gêneros mais rápidos, menos gravações de checkpoint durante scan e carregamento de estado, reconciliação de backfill e lock de escrita streaming deixam de ocupar main thread
- **Pipeline de reprodução** — agendamento de buffers sai da main thread para que rolagem não acompanhe ritmo de decode; fila e roteamento foram reconstruídos; em passthrough High Fidelity, barra de volume delega ao volume de hardware do dispositivo de saída
- **Limpeza de duplicados** — deixa de apagar arquivos de fontes WebDAV e não remove mais por engano faixas de mesmo nome com tags incompletas
- **Lista de músicas no macOS** — topo fica fixo durante rolagem, cabeçalho permanece preso e ordenação/layout de colunas melhoram
- **Limpeza dos Ajustes** — grupos reordenados, letras ganham categoria própria, menus dispersos são consolidados e temas/ícones aparecem como tiles
- **Interface Apple TV** — tela de credenciais remove moldura externa e explica que senhas podem sincronizar pelo telefone; texto segue escala do sistema; gráficos, pastas, artistas, recebimento de transferências e seleção de pastas de scan são renderizados por páginas
- **Transições de detalhe** — álbum, playlist e artista passam a expandir a partir do cartão
- **Espaçamento de letras** — linha e tradução ficam mais próximas, com mais espaço entre linhas
- **Fontes ainda não oferecidas** — fnOS e UGREEN deixam de aparecer na adição de fonte; ambos aguardam API pública do fabricante
- **Outros** — melhorias no player cápsula do iPad, reutilização de cache da Home, barras de rolagem das fontes e fundo de estado ativo de Shuffle/Repeat; imagens de artista usam capa de faixa como fallback, logos automáticos de rádio não sobrescrevem manuais, álbuns de uma pasta deixam de ser separados por artista da faixa e fonte com falha deixa de ser sondada repetidamente

### Corrigido

- **Tags corrompidas** — corrigidas tags de álbum truncadas/corrompidas, campos de artista vazando entre si e partes do backfill de metadados
- **Scan de bibliotecas grandes** — corrigidos scan que não retomava ao voltar ao foreground, scans grandes fnOS travando/reconstruindo repetidamente, scans que não voltavam após backoff, faixas perdidas e retentadas indefinidamente em erro de pasta, faixas removidas quando pasta compartilhada ficava inalcançável e rescan WebDAV apagando músicas
- **Concorrência** — corrigidos rebuilds de índice descartados, patches de backfill sobrescrevendo uns aos outros e starvation de persistência, além de conflitos entre recuperação de metadados e cache streaming e races no registro de background tasks e limpeza de cache
- **Carregamento infinito em HTTPS interno** — prompt de confirmação de certificado passa a aparecer, evitando fontes internas HTTPS presas para sempre
- **Interrupções e troca de faixa** — corrigidos Apple Music pulando várias faixas e sem avançar ao fim, faixa atual ficando muda segundos após alternar shuffle e player preso em loading após stream remoto travar
- **Arrastar fila** — crash corrigido; handle de arrastar removido em favor de pressão longa na linha
- **Estatísticas de audição** — contagens e durações infladas corrigidas; tempo real passa a acumular a partir dos incrementos de playback
- **DLNA** — corrigida tempestade de reinício do listener e backlog de logs que derrubavam o app; ciclo de vida de retry isolado
- **Detecção de duplicados** — faixas de mesmo nome em álbuns diferentes deixam de ser tratadas como duplicatas; corrigidos também exclusão do arquivo da fonte e recuperação de permissão
- **Telas de ajustes em branco** — corrigido retorno de subitem para página vazia e entrada Apple TV abrindo em branco; temas/ícones ficam acessíveis novamente e página é restaurada após sair da busca de ajustes
- **Capas no CarPlay** — listas voltam a mostrar capas sem piscar entre placeholder e arte real
- **Widgets macOS** — capa deixa de quebrar layout e label mostra corretamente Pausado
- **Destaque de letras** — corrigido destaque na tradução quando origem word-level e tradução de linha inteira compartilham timeline; linhas quebradas não destacam duas linhas de uma vez
- **Apple TV** — corrigidos shuffle, estado de 2FA, leitura de pastas NFS durante scan, autorização de cloud drive por QR, reprodução da biblioteca inteira, network probing na Home, controle remoto travando em listas longas, ausência de motivo após verificação falhar e loop de confiança de certificado NAS
- **Consumo de energia e dobráveis** — corrigidos amplificação de escrita de logs e loop de limpeza de cache, reduzindo energia durante playback, e layout adaptado a telas dobráveis
- **Outros** — corrigidos Top Artistas vazio na Home, classificação de pastas e crash ao abrir pasta, código de acesso/reconexão FN Connect, capa personalizada desaparecendo após refresh, pedido de avaliação repetido e sync do Apple Music após mudança de região da loja

### Desempenho

- **Reprodução DTS** — decoder agrega buffers de saída na granularidade nativa, eliminando travamentos de rolagem durante DTS
- **Listas e estatísticas** — corrigidos stalls de main thread ao reproduzir/rolar lista de músicas e ao alternar estatísticas/renderizar calendário do macOS

---

## [1.9.5] (builds 65–67) — 06/09/2026

Esta versão adiciona transferência entre dispositivos pela rede local com gerenciamento via web, torna a música local acessível pelo app Arquivos, apresenta a fonte Songloft e nove novos idiomas e acelera significativamente a leitura de tags.

### Adicionado

- **Transferência entre dispositivos** — mova músicas entre aparelhos na rede local, escolhendo faixas pela biblioteca ou gerenciando-as por uma página web; um iPhone também pode enviar seu áudio em cache para um dispositivo próximo
- **Acesso pelo app Arquivos** — músicas locais ficam diretamente acessíveis no app Arquivos
- **Fonte Songloft** — suporte ao Songloft, incluindo sincronização de playlists e rádios
- **Nove novos idiomas** — mais nove idiomas de interface, com localização concluída nas plataformas
- **Atividade de letras ao vivo** — letras na Tela Bloqueada e Dynamic Island
- **Estatísticas de audição** — calendário de audição do macOS ganha tendências de duração e divisão por horário do dia; detalhes da música mostram contagem de reprodução do servidor
- **Troca de escopo da busca** — a busca pode alternar escopo/contexto por um botão dedicado
- **Preenchimento de imagens de artistas** — imagens ausentes são completadas automaticamente
- **Navegação por pastas no macOS** — navegador e páginas de detalhe por pasta no Mac
- **Estilo da capa no Acesso Rápido** — aparência das capas da seção pode ser configurada
- **Releitura de tags em lote no Apple TV** — tags podem ser relidas em massa na TV

### Alterado

- **Leitura de tags mais rápida** — leitura via SMB ficou significativamente mais rápida e continua em background; a velocidade é ajustável; modo máximo ganhou proteção, cooldown e recuperação de tarefas, com erros mais claros
- **Experiência de transferência** — seleção de faixas usa árvore; rolagem/carregamento sustentam bibliotecas grandes; recebimento mostra progresso e resultado; transferências não podem mais ser dispensadas acidentalmente e barra de seleção/controles compartilham um estilo
- **Navegação da biblioteca** — busca e detalhes unificados, resultados de álbum e troca de navegação melhorados, cabeçalho de artista mais compacto com cartões consistentes e refinamentos em artista/gênero
- **Backfill de tags em WebDAV** — tags são preenchidas sob demanda enquanto uma faixa WebDAV toca
- **Compatibilidade de letras** — suporte a letras palavra a palavra no formato entre colchetes e restauração de caches antigos
- **Remoção de fontes locais** — refinadas as regras de limpeza de arquivos ao remover uma fonte local
- **Overhead da reprodução em rede** — menos downloads repetidos e menos trabalho de indexação em background
- **Interface do macOS** — melhorias na navegação do player e interação com progresso, entradas de ferramentas e capa padrão, layout waterfall dos cartões de fontes e estatísticas de servidor

### Corrigido

- **Reprodução remota** — corrigidas interrupções, faixas puladas incorretamente e posição voltando para trás
- **Travamento do Apple Music na abertura** — app deixa de travar ao carregar capas durante startup
- **Desconexões WebDAV** — corrigido crash ao continuar lendo após desconexão
- **Pastas de serviços de nuvem** — pastas passam a ser navegáveis imediatamente após autorização
- **Troca entre rede interna/externa** — corrigida confusão entre erros de negócio ao trocar uma fonte entre redes, além de detecção de rede e releituras em massa
- **Detecção de artista do álbum** — corrigida e melhorada a navegação por álbuns adicionados recentemente
- **Volume voltando sozinho** — corrigido volume retornando ao valor anterior quando ajustado durante pausa
- **Modo minimalista** — corrigidos espaçamento de páginas e player cobrindo conteúdo
- **Falhas na leitura de tags** — falhas isoladas, menor overhead na tela de detalhes e velocidade exibida corrigida ao trocar de marcha
- **Apple TV** — corrigidos scan, sync e playback da biblioteca
- **Navegação por pastas no macOS** — corrigida e melhorada a exibição de informações no player

### Desempenho

- **Agendamento de leitura de tags** — entrada de alto desempenho foi movida para a fonte de música e se adapta à capacidade do dispositivo; fila do Apple TV também foi melhorada

---

## [1.9.4] (builds 59–64) — 03/09/2026

Esta versão adiciona compartilhamento de música com criptografia ponta a ponta, transições Smart Mix sincronizadas ao beat e playlists inteligentes por streaming, conecta ao China Telecom Cloud e corrige saída sem fio e perda de estado do player.

### Adicionado

- **Compartilhamento de música** — qualquer fonte legível pode gerar link seguro de reprodução, com códigos curtos, links permanentes, proteção contra adivinhação e criptografia ponta a ponta; use o serviço integrado ou hospede o seu, com relay Cloudflare e implantação em dois modos
- **Smart Mix** — analisa batidas e mistura faixas com transições segmentadas
- **Playlists inteligentes por streaming** — resultados aparecem enquanto são gerados, fila de recomendações acompanha o stream e itens já gerados sobrevivem à troca de fonte
- **China Telecom Cloud** — suporte ao serviço, incluindo integração de protocolo e validação de segurança
- **Sincronização de cache pela rede local** — sincronize cache de áudio com um dispositivo escolhido na LAN
- **Atualizar letras a partir da fonte** — busque novamente letras da fonte, com campos de tradução e edição segura
- **Letras em widgets** — widgets exibem letras longas e acompanham playback
- **Swipe para ações de fila** — deslize na lista de músicas para agir sobre a fila
- **Filtros de busca no macOS** — filtre por música, álbum, artista ou letras
- **Reprodução independente em dispositivos externos** — dispositivos externos podem tocar áudio por conta própria
- **M4A multicanal** — playback de áudio pelo sistema suporta M4A multicanal
- **Scan Navidrome ao abrir** — scan no startup e playlists mantêm cópia offline automaticamente

### Alterado

- **Modo minimalista** — navegação superior e player flutuante reconstruídos, com ajustes em Home, busca e configurações e transições de detalhe mais suaves
- **Fingerprints das fontes** — verificações de fingerprint de segurança ficam consistentes entre plataformas
- **DLNA** — descoberta de alto-falantes e chave de recebimento ficam independentes
- **Now Playing do sistema** — letras linha a linha ficam ativas por padrão
- **Interrupções do Apple Music** — política de interrupção da sessão de áudio com tratamento e recuperação melhores
- **Reprodução imersiva no Apple TV** — tela permanece ligada durante playback imersivo
- **Exclusão de fontes grandes** — recuperação de cache melhorada ao remover fonte grande
- **Scan local e backfill** — scan local e metadata backfill melhorados, com menos gravações redundantes do estado de sync
- **Orientações da Siri** — exemplos de frases refinados e orientação para solicitar uma faixa específica

### Corrigido

- **Saída sem fio** — corrigidos silêncio/ruído após mudança de configuração da saída wireless e foco de áudio ao AirPlay retornar ao aparelho (#80)
- **Estado perdido do player** — player deixa de ser limpo após longa reprodução em background e o estado não se perde na troca automática de faixa
- **Crash do relógio de reprodução** — corrigido após interrupção de áudio
- **Mudanças de faixa no Navidrome** — trocas consecutivas deixam de ficar presas em loading
- **Deadlock de cache** — corrigido deadlock de concorrência no cache de streaming remoto
- **Travamentos no seletor de pastas** — corrigidos ao selecionar pastas em múltiplos protocolos e ao excluir fonte recente
- **Cache apagado em upgrade** — cache de áudio deixa de ser removido durante atualização
- **Interação do player** — corrigida barra de progresso não arrastável e stall ao expandir o player pela primeira vez
- **Barra de ações em lote** — deixa de ficar escondida pela tab bar
- **Letras na Tela Bloqueada** — deixam de desaparecer ocasionalmente na Tela Bloqueada e widgets
- **Fila de recomendações** — reprodução não para mais ao chegar ao final
- **Descoberta DLNA** — dispositivos são encontrados mesmo com várias interfaces de rede
- **Write-back remoto de letras** — validação de leitura após gravar letras corrigida
- **Fontes desabilitadas** — fila deixa de tentar reproduzir de uma fonte desativada
- **Credenciais de convidado** — estado de scan permanece compatível ao trocar credenciais em fonte guest
- **Notificações de janela no macOS** — corrigido crash de concorrência
- **Apple TV** — corrigidos saltos de foco nas abas superiores, recuperação de playback e carregamento de letras Subsonic
- **Outros** — corrigidos classificação de pasta de biblioteca em media servers, carregamento de arte de rádio na Home, Daoliyu não preservando áudio original e IDs internos de fonte vazando para pesquisas de scraper

### Desempenho

- **Scan WebDAV** — menor carga de scan e tela de detalhes de tags mais rápida

---

## [1.9.3] (builds 53–58) — 31/08/2026

Esta versão amplia serviços inteligentes com múltiplos fornecedores e sincronização entre dispositivos, adiciona estatísticas de audição do servidor e transcrição de áudio e refina exibição/alinhamento de letras palavra a palavra.

### Adicionado

- **Serviços inteligentes multi-fornecedor** — suporte a vários protocolos e provedores, listas de modelos buscadas online, fallback automático quando um serviço está indisponível e ajustes sincronizados entre dispositivos
- **Serviço inteligente integrado** — serviço interno protegido por verificação do dispositivo, utilizável sem configurar uma chave própria
- **Recomendações inteligentes** — biblioteca gera recomendações por cenário, temas podem ser revisados/excluídos e Home/área de recomendações mostram skeleton loading
- **Transcrição de áudio** — transcreva o áudio de uma faixa e use o resultado para melhorar recomendações
- **Estatísticas de audição do servidor** — lê estatísticas de serviços compatíveis e usa snapshot em cache quando offline
- **Cores personalizadas de letras** — incluindo gradientes
- **Imagem de artista** — detectada automaticamente e também configurável manualmente
- **Parsing multiartista** — separa múltiplos artistas por regra, protegendo nomes que devem permanecer intactos
- **Capa dinâmica de álbum** — suporte a artwork animado fornecido pela fonte
- **Rádio com Siri** — pesquise e reproduza estações pela Siri
- **Limpar Excluídos Recentemente em lote** — esvaziamento seguro em massa
- **Auto-refresh Navidrome** — atualiza ao voltar ao foreground e playlists sempre mantêm cópia offline

### Alterado

- **Ajustes dos serviços inteligentes** — tela reconstruída com visual consistente em todas as plataformas e simplificada em telefones, com texto mais claro, ambientes de teste/produção separados e nota explícita de que uma chave da API OpenAI não é uma assinatura do ChatGPT
- **Agendamento de requisições** — feedback de quota e scheduling melhorados, com refresh de recomendações em background limitado
- **Leitura de tags multiformato** — mais formatos compatíveis e diagnósticos para falhas
- **Conclusão de tags em background** — cada passe é limitado e deixa de executar por tempo excessivo
- **Letras e visuais imersivos** — camadas de letras full-screen e campo de texto multicamada reconstruídos, animação de texto/saída imersiva refinadas e fluxo de letras na parede de títulos suavizado
- **Detalhes da verificação de tags** — layout mobile redesenhado, hierarquia simplificada e estado “não totalmente verificado” diferenciado
- **Importação de playlists** — movida para ações da biblioteca
- **Busca** — busca por caminho/palavra-chave e resultados inteligentes coexistem
- **Interface macOS** — nome do app deixa de aparecer na titlebar e listas longas rolam mais suavemente

### Corrigido

- **Letras palavra a palavra** — corrigidos truncamento/layout em idiomas RTL, jitter do destaque em persa, primeira linha destacando cedo durante intro, atraso em gaps silenciosos ELRC, destaque interrompido em vocais sobrepostos e progresso da próxima faixa durante crossfade
- **Idioma e tradução de letras** — detecção incorreta deixa de bloquear repetidamente com prompt; letras sem tag de idioma usam direção correta
- **Conexões de serviços inteligentes** — corrigidos autenticação/verificação do serviço integrado, autenticação do endpoint DeepSeek e geração estruturada sem resposta; diagnósticos de conexão adicionados
- **Leitura de tags** — backfill passa a iniciar após scan de cloud drive, falhas locais são reportadas, releituras na nuvem não marcam áudio válido como inválido e aquecimento por leituras em background foi corrigido
- **Crash no startup** — corrigido com artistas duplicados na biblioteca, além de stalls e crash da toolbar em detalhe de artista
- **Indexação em background** — índice da biblioteca deixa de rodar sob carga alta sustentada
- **Sync do Apple Music no startup** — stalls causados por sincronizar ao abrir foram corrigidos
- **Fontes remotas** — caminhos com caracteres especiais, form encoding, duração DTS e migração de dados históricos corrigidos
- **Posição de playback** — seek volta a ter efeito quando pausado
- **macOS** — corrigidos titlebar fora de posição/desaparecendo, stalls em listas longas, números de faixa quebrando linha, regressão na configuração nativa de widgets e botões de play de widgets não clicáveis diretamente
- **Apple TV** — foco/controle remoto corrigidos e maior responsividade de fontes/biblioteca

---

## [1.9.2] (builds 42–52) — 26/08/2026

Esta versão traz temporização de letras palavra a palavra e player imersivo unificado entre plataformas, adiciona serviços inteligentes com busca semântica e referências diretas a arquivos locais e resolve certificados HTTPS, stalls em bibliotecas grandes e fontes inválidas sendo salvas.

### Adicionado

- **Temporização palavra a palavra** — ajuste a timeline palavra por palavra, com política de scroll para longos trechos instrumentais, letras na Tela Bloqueada e ações nativas de favorito
- **Reprodução imersiva** — player full-screen unificado no iPhone, Mac e Apple TV, com waveform em tempo real redesenhado, parede de títulos guiada pela fila e efeitos visuais configuráveis
- **Serviços inteligentes e busca semântica** — serviços extensíveis sustentam busca semântica não bloqueante, ordenada por melhor correspondência
- **Referências diretas a arquivos locais** — referencie arquivos/pastas locais com autorização persistente; pastas referenciadas sincronizam automaticamente
- **Capas personalizadas de álbuns/playlists** — substitua artwork pelo seu
- **Cor de tema derivada da capa** — acompanha a arte atual nas três plataformas
- **Sync de rádios do servidor** — sincroniza estações, incluindo artwork Subsonic
- **Sync bidirecional de favoritos** — favoritos sincronizam nos dois sentidos com Emby e Navidrome, com rollback em falha
- **Seleção de pastas no Google Drive** — autorize pelo Google Drive Picker e escolha pastas
- **Snapshot sync do Baidu Netdisk** — sincronização por snapshot
- **Write-back de tags WebDAV** — tags e capas podem ser gravadas de volta
- **Ordenação e índice alfabético da lista** — ordene e salte por índice alfabético
- **Excluir da fila** — remova faixas diretamente, com feedback de arrastar mais forte (#40)
- **Navegação da biblioteca no macOS** — detalhes abrem inline, grid de playlists se adapta à janela e playlists podem ser gerenciadas pela sidebar
- **Pastas de scan SMB** — escolha uma pasta folha ou raiz do share
- **Visibilidade do controle de volume** — escolha se o slider aparece

### Alterado

- **Limites dos serviços inteligentes** — credenciais específicas do dispositivo deixam de sincronizar na nuvem, API keys são isoladas por endereço do serviço, conexões plaintext ficam limitadas a endereços privados, requisições têm timeout/tamanho máximo e resultados obsoletos são descartados quando região da loja muda
- **Excluídos Recentemente** — retenção passa a 30 dias em todos os lugares
- **Aparência consistente do player** — temas/reprodução imersiva iguais entre plataformas, com cores de rádio e tema duplo do tvOS ajustados
- **Exibição de letras** — alinhamento e blur melhorados, com profundidade de campo em linhas não atuais
- **Cache de áudio** — limite de tamanho e comportamento de encerramento refinados
- **Bluetooth e CarPlay** — playback Bluetooth melhorado e melhorias de reprodução/gerenciamento de interface no CarPlay
- **Avisos de conexão insegura** — localização de warnings para HTTP sem TLS concluída
- **Interação macOS/iPad** — navegação Voltar e ações em lote melhores no Mac, gesto de troca de faixa do player no iPad restaurado e ícones de controle menores no mini player expandido

### Corrigido

- **Certificados HTTPS** — corrigidos prompt bloqueando playback de fontes internas, fallback incorreto após renovação de certificado, certificados WebDAV autoassinados impossíveis de confirmar e fontes confiáveis travando após troca de certificado
- **Fontes inválidas sendo salvas** — fonte deixa de ser criada quando verificação SMB falha, configuração Jellyfin é inválida ou autenticação do media server falha; cancelar nova fonte WebDAV não deixa resíduo e fontes apagadas não voltam
- **Recuperação após interrupções** — corrigidos pulos indevidos e autoplay após interrupção; playback retoma após interrupção longa e sessão não é mais perdida no startup
- **Downloads para playback remoto** — primeira faixa após cold launch não espera download completo, seek não trava esperando arquivo inteiro e download de uma faixa não aparece como cache de toda a fonte
- **Compatibilidade de letras** — corrigidas letras RTL, texto simples desaparecendo após rescan e reconhecimento/codificação de letras embutidas em ALAC/M4A
- **Reconhecimento de artwork** — capa embutida válida deixa de ser rejeitada, coletâneas agrupam por album artist, álbum sem capa usa a faixa como fallback e artwork de playlist resolve igual nas plataformas
- **Baidu Netdisk** — identidade da biblioteca e segurança do refresh após mover arquivo, reconciliação ao substituir arquivo no lugar e write-backs bem-sucedidos reportados como falha foram corrigidos
- **Google Drive** — write de sidecars endurecido e write-back multiformato de letras/autorizações de scan corrigidos
- **Navidrome pela rede pública** — reprodução autenticada de faixas sem cache e refresh incremental interrompido com pastas ausentes corrigidos
- **Apple TV** — crash em cold launch por cor dinâmica, troca lenta de aparência, checagem de capacidade de armazenamento e estilo de foco do play/busca corrigidos
- **Janelas do macOS** — botões nativos e container da titlebar restaurados; sidebar volta a ser redimensionável
- **Player full-screen** — corrigidos interação de saída/toque após rotação, tamanho do seletor de efeitos e posição da barra de progresso em paisagem
- **Manutenção em background** — tasks deixam de acordar repetidamente e são isoladas do sync de fonte local
- **Outros** — corrigidos precheck de permissão de escrita que nunca terminava, seleção/proteção de exclusão durante limpeza de duplicados, sample rate incorreta na saída High Fidelity, backfill sem retry após recuperação da fonte e player do iPad cobrindo conteúdo quando o seletor de artwork fechava imediatamente

### Desempenho

- **Bibliotecas grandes** — cold launch mais curto, menos contenção ao resolver metadata e menos stalls no foreground e nas transições foreground/background
- **Listas longas e filas grandes** — renderização e saltos no índice alfabético melhorados; alto uso de CPU por fonte com falha em fila grande corrigido
- **Merge incremental** — menor uso de memória ao mesclar mudanças e geração mais rápida de artwork de playlists

---

## [1.9.1] (builds 37–41) — 14/08/2026

Esta versão adiciona sync de playlists de servidor e navegação por pastas, ações em lote na lista de músicas e transições inteligentes com remoção de silêncio.

### Adicionado

- **Sync de playlists de servidor** — playlists de Jellyfin, Emby e Plex são espelhadas localmente e mantidas sincronizadas
- **Navegação por pastas** — navegue pela hierarquia da fonte, incluindo diretórios de storage em nuvem
- **Ações em lote** — selecione várias músicas e aplique ações em conjunto
- **Transições inteligentes e remoção de silêncio** — transições suaves entre faixas, pulando automaticamente silêncio no início/fim
- **Swipe no mini player** — deslize para esquerda/direita para trocar de faixa
- **Hierarquia de playlists Apple Music** — biblioteca do Apple Music apresentada por playlist
- **Redirects de mídia WebDAV** — reprodução segue redirect para CDN, aliviando servidor de origem
- **Conversão de formatos de letras** — converta entre formatos com melhor detecção
- **Letras de media server** — suporte fortalecido em diversos servidores
- **Visibilidade de rádio na Home** — escolha se seção de rádio aparece
- **Atalhos de teclado no macOS** — atalhos personalizáveis

### Alterado

- **Filas muito grandes** — renderização melhor e nova entrada de reprodução por pasta
- **Ordenação de bibliotecas grandes** — passa a mostrar progresso
- **Controles do player** — tamanhos/layout unificados
- **Cache do Apple Music** — estratégia de cache e foco da busca na titlebar melhorados

### Corrigido

- **Nomes de arquivo corrompidos** — recuperação de nomes em faixas de cloud drive corrigida, evitando diagnóstico incorreto nos detalhes
- **Playlists apagadas voltando** — sync não restaura mais playlist excluída
- **Proxy reverso WebDAV** — leitura de diretórios e redirects corrigidos
- **Duração MP3** — cálculo e retry corrigidos
- **Limites das ações em lote** — ações e exclusões endurecidas; multisseleção de pastas melhorada
- **Ordenação/seleção em bibliotecas grandes** — mais eficiente, com barra de ações em lote ajustada
- **Salvar letras retimed** — letras obtidas por scraping voltam a salvar após reajuste de tempo
- **Scan de cloud drive** — scan e metadata backfill endurecidos
- **Intenção de playback e recuperação** — intenção unificada e estado restaurado após interrupção
- **Now Playing no macOS** — crash corrigido e atalho de espaço para play restaurado

---

## [1.9.0] (builds 30–36) — 10/08/2026

Esta versão adiciona interface localizada e pedidos por voz via Siri, permite personalizar a cor do tema e separa a Home em modos de música e rádio.

### Adicionado

- **Interface localizada** — textos do app seguem o idioma do sistema
- **Pedidos de música local pela Siri** — peça à Siri para tocar faixas da biblioteca local
- **Cor de tema personalizada** — escolha uma cor ou fixe-a para deixar de acompanhar artwork
- **Modos da Home** — alterne entre música e rádio; parede de estações se adapta à orientação
- **Conexões adaptativas** — uma fonte pode manter vários endpoints e escolhe o que funciona na rede atual
- **Favoritar pela Tela Bloqueada** — marque uma faixa como favorita diretamente pelo widget
- **Arrastar para reordenar fila** — reorganize a fila por drag
- **Edição full-screen de letras** — incluindo conteúdo multilíngue
- **WAV remoto** — suporte de playback aprimorado

### Alterado

- **Setup de fontes mais simples** — preferências de conexão removidas; conexões adaptativas decidem como alcançar a fonte
- **Editor de letras** — interface e sincronização com playback reconstruídas
- **Buffering e scraping de álbum** — gerenciamento de buffers melhorado e páginas de álbum podem iniciar scraping
- **Progresso de scan** — mais claro, com erros de cloud sync reportados sem mascaramento
- **Pedido de avaliação** — momento do prompt da App Store ajustado, com melhorias de backup

### Corrigido

- **Fontes de nuvem após upgrade** — algumas fontes voltam a ser restauradas corretamente
- **Cache offline e scan Navidrome** — corrigidos, com scans mais rápidos
- **HTTP público e confiança em endpoint** — compatibilidade melhorada
- **Gerenciamento de rádio** — estações podem ser gerenciadas diretamente da lista
- **Ordenação de músicas** — interação mais suave durante sort
- **Leituras repetidas de tags** — bibliotecas de servidor deixam de reler a mesma faixa repetidamente

---
