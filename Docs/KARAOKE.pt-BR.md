<p align="right"><a href="KARAOKE.md">Original</a> · <strong>Português (Brasil)</strong></p>

# Karaokê entre dispositivos

Atualizado em 26/09/2026. Este documento distingue a implementação existente no workspace principal daquilo que já foi publicado. Alterações ainda não enviadas ou não publicadas não devem ser tratadas como recursos já disponíveis aos usuários.

| Recurso | iPhone / Mac | Apple TV no workspace principal | Limites no Apple TV |
| --- | --- | --- | --- |
| Remoção de vocais, mudança de tom e dueto | Implementado | Implementado | Usa um tap de processamento de áudio no AVPlayer; controles ficam desativados em caminhos de reprodução incompatíveis. |
| Pontuação | Microfone local | iPhone envia a altura detectada | O telefone não envia a voz em tempo real para a TV. |
| Separação por IA | Modelo local | Modelo local ou trilha vocal enviada pelo iPhone | A implementação de modelo local já existe, mas ainda precisa ser integrada; o download exige tvOS 26.4+ e a publicação do pacote do modelo deve ser validada separadamente da publicação do app. |
| Pareamento com versão instrumental | Implementado | Implementado e aprovado em testes direcionados | Reutiliza a política de pareamento; alternar entre original e instrumental preserva posição, estado de pausa e letras, trocando apenas o item atual da fila. A versão instrumental pode reutilizar as letras da original. |
| Destaque de palavras por IA | Implementado | Implementado e aprovado em testes direcionados | Detecta o início das palavras a partir da faixa vocal do telefone ou do modelo local; preserva temporizações já existentes e só infere quando há apenas sincronização por linha. |
| Guia vocal da gravação original | Implementado | Implementado e aprovado em testes direcionados | Usa mensagens de altura e silêncio vindas do telefone. Não ativa em desconexão, mensagens paradas, versão instrumental ou caminhos de áudio incompatíveis; reutiliza a supressão de vazamento do alto-falante. |
| Loop de uma linha, loop expandido e redução de velocidade | Implementado | Implementado e aprovado em testes direcionados | De 0,5× a 1,0×. A prática pausa a pontuação; o loop continua no fim natural do trecho. Ao sair do palco, a velocidade original é restaurada e o loop é limpo. |
| Interface de palco | Reformulada em 26/09/2026 | Adaptada e aprovada por inspeção de screenshots | O destaque branco por palavra usa o mesmo componente de letras; layout lateral para tela grande, controles com foco do Siri Remote, área de controles rolável e painel de QR Code do microfone. |
| Gravação e retorno de voz | Compatível em dispositivos e rotas de áudio adequadas | Não oferecido | A sessão atual da TV não captura voz em tempo real; o telefone conectado envia apenas altura e trilha vocal de IA offline, portanto esse recurso não faz parte da migração direta. |

A entrada de Karaokê fica no menu de opções da tela de reprodução e aparece quando há uma música em reprodução que não seja conteúdo falado.

Implementações relacionadas: `Primuse/Services/Audio/KaraokeSession.swift`, `Primuse/Views/NowPlaying/KaraokeStageView.swift`, `PrimuseTV/Model/TVKaraokeSession.swift` e `PrimuseTV/Views/TVKaraokeStageView.swift`. As regras compartilhadas ficam em `PrimuseKit` nas políticas `Karaoke*Policy`; o componente compartilhado de renderização por palavra é `KaraokeLineView`.

Validação deste lote e itens restantes: o build Debug no Xcode 27.0 / simulador tvOS 27.0 foi aprovado; 10 testes de integração direcionados passaram; após os ajustes finais de rastreamento de velocidade e estilo dos controles, os 5 testes diretamente afetados foram executados novamente e passaram; uma captura de palco em 3840×2160 foi inspecionada; a localização em 16 idiomas e a revisão de diff também passaram. Ainda não foram executados pareamento em Apple TV físico + iPhone, avaliação auditiva com músicas reais, alternância entre fontes de rede e validação via TestFlight. Os cinco itens completados nesta tabela e a implementação do modelo local ainda precisam ser integrados e publicados.

## Limites entre Medley e Karaokê (26/09/2026)

O Apple TV já possui suporte a medley: ele pode ser iniciado a partir da fila atual, da tela inicial, de coleções de músicas, da lista de artistas e dos menus de contexto de álbuns/playlists. Cada música usa 10 segundos por padrão, com opções de 10, 20, 30, 45, 60 ou 90 segundos nas configurações da TV ou nas opções de reprodução.

O recurso reutiliza a política compartilhada de segmentos, pré-carrega dois caminhos e faz fade entre eles. Há suporte a pausa, seek, anterior/próxima, repetição da lista, pular faixas com erro e continuar a música completa preservando a posição original. Fila e letras usam a linha do tempo do segmento. Segmentos não são gravados de volta na biblioteca, não contam como reprodução, não geram scrobble e não substituem o snapshot de restauração da fila normal.

Assim como no iPhone, Apple Music, CUE, vídeo e conteúdo falado não entram em medleys. Durante um medley no Apple TV, a entrada de Karaokê fica oculta; ao escolher “Reproduzir esta música inteira”, ela volta a aparecer. As duas sessões de reprodução são independentes e loops de prática não se aplicam aos segmentos do medley. A duração preferida fica salva apenas na TV e entra em vigor na próxima vez que o medley for iniciado.

Neste lote, o build Debug no Xcode 27.0 / simulador tvOS 27.0 passou, assim como 10 testes de integração direcionados cobrindo troca real entre dois caminhos de áudio, pausa/retomada durante fade, interrupção do sistema, retomada completa na posição original, pular/repetir faixas com erro, reinício no fim da fila e isolamento de metadados/histórico. Após os ajustes finais de estado, os 3 casos diretamente relacionados foram reexecutados. Também foram inspecionadas quatro capturas de 3840×2160 de configurações, opções, fila e tela de reprodução; localização em 16 idiomas e revisão de diff passaram. O índice de evidências fica em `.codex/diagnostics/tv-medley/validation.json`.

Ainda não foram validados em Apple TV físico: percepção auditiva pelos alto-falantes, comportamento em redes lentas com servidores reais e pacote do TestFlight. Este documento descreve o estado do workspace principal, não uma versão já publicada.

No iPhone/Mac (27/09/2026), segmentos de medley em streams HTTP por blocos, como Synology, e streams de serviços em nuvem passam a iniciar e preparar o fade diretamente a partir do ponto inicial do trecho, em vez de baixar e decodificar desde o começo do arquivo para depois descartar. Antes disso, até em rede local havia um período de espera. Para essas fontes, o próximo segmento ainda não faz prefetch da música inteira em segundo plano nem usa crossfade — isso continua restrito a arquivos locais — e a transição é um corte curto. O medley do Apple TV já usava dois caminhos previamente posicionados e não foi afetado. Ainda não foi identificada a causa de o segmento parar automaticamente após terminar; foi adicionado o log `🎛️ Medley: no slice after …` para reprodução em dispositivo físico.
