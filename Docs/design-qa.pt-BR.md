# Validação de design da página de compartilhamento

## Referência de design

- Arquivo-fonte: `design/share.zip`
- Referência descompactada: `Primuse 音乐分享.dc.html`
- Escopo implementado: páginas públicas de compartilhamento para desktop e celular, tela prévia de senha, modal de QR Code, página de compartilhamento indisponível e estados principais de reprodução, cópia, download e importação.
- Viewport desktop: CSS `1440 × 1024`; screenshots do navegador normalizadas pela densidade de pixels para `720 × 512`.
- Viewport móvel: CSS `390 × 844`; screenshots originais normalizadas pela densidade de pixels e ampliadas para `390 × 844`. O design inclui uma barra de status simulada, enquanto a implementação web começa na área de conteúdo do navegador; por isso a comparação usa a linha de base do conteúdo.

## Evidências de comparação lado a lado

- Público desktop: `.codex/share-design-qa/comparison-desktop-pass2.png`
- Público móvel: `.codex/share-design-qa/comparison-mobile-pass3.png`
- Pré-tela de senha: `.codex/share-design-qa/comparison-password.png`
- QR Code no celular: `.codex/share-design-qa/comparison-qr-mobile.png`
- QR Code no desktop: `.codex/share-design-qa/comparison-qr-desktop.png`
- Compartilhamento indisponível: `.codex/share-design-qa/comparison-unavailable.png`
- Evidência de QR Code escaneável: `.codex/share-design-qa/implementation-qr-code.png`

Em cada arquivo, o lado esquerdo mostra a referência de design e o lado direito a implementação. A página de senha e o modal de QR Code usam screenshots completos de estado. O QR Code também foi recortado separadamente e decodificado com Apple Vision; o resultado é o URL normalizado atual `https://share.soundisle.com/s/<token>`, sem URL de áudio, chave ou senha.

## Registro de comparação e correções

1. Na primeira versão móvel, a capa estava grande demais, o player havia sido colocado dentro de um cartão extra e a área de ações rolava junto com a página.
2. Na segunda rodada, a capa foi ajustada para `236px`, o cartão extra do player foi removido, a bandeja inferior de ações passou a ser fixa e as informações de formato, permissões e validade foram reorganizadas.
3. Na versão final, a página móvel em `390 × 844` não apresenta overflow horizontal ou vertical; no desktop, proporção das colunas, cabeçalho/rodapé, hierarquia tipográfica e espaçamentos principais correspondem ao design.
4. No desktop, o QR Code usa diálogo centralizado; no celular, usa drawer inferior. Fechar, salvar, copiar e imprimir correspondem aos estados previstos para cada breakpoint.
5. Compartilhamentos inexistentes, expirados e revogados usam a mesma página HTTP 410 sem revelar informações sobre a música.

## Resultado final

- Não foram encontrados problemas visuais, de interação, responsividade ou acessibilidade de nível P0, P1 ou P2.
- P3: a capa no design é uma ilustração CSS conceitual; a implementação usa um recurso de imagem real gerado no mesmo tema e paleta. O QR Code é realmente escaneável, portanto os módulos não coincidem com o placeholder do design. As duas diferenças são substituições deliberadas para produção.
- O console do navegador não apresentou erros nem warnings nas páginas pública, móvel, senha, QR Code ou 410.
- Reprodução/pausa, feedback de cópia, abertura/fechamento do QR Code e importação de uso único foram validados localmente. A primeira requisição Range da importação de uso único retornou HTTP 206; uma tentativa de reutilização retornou HTTP 410.

Resultado final: aprovado.
