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
