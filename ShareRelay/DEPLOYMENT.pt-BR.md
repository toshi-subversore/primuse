<p align="right"><a href="DEPLOYMENT.md">Original</a> · <strong>Português (Brasil)</strong></p>

# Guia de implantação do Primuse Share Relay

Este diretório oferece duas formas de implantação compatíveis com a API de media relay do Primuse:

| Opção | Onde executa | Armazenamento | Quando usar |
| --- | --- | --- | --- |
| Docker | Seu próprio host Linux ou NAS | Docker Volume persistente | Quando você quer controle total de custos, logs e localização dos dados |
| Cloudflare Worker | Rede de borda da Cloudflare | Bucket R2 privado | Quando você quer domínio público, acesso global e TLS sem manutenção própria |

As duas opções oferecem as mesmas interfaces de criação, criptografia no cliente, upload em blocos, reprodução/download com descriptografia local no navegador, importação de uso único, proteção por senha e revogação. O layout de armazenamento é diferente, portanto os dados não podem ser compartilhados diretamente entre as duas implementações. Em produção, configure apenas um endereço de API no Primuse.

## Página de compartilhamento e contrato da API

Há dois formatos de endereço público. Em ambos, abrir o URL no navegador mostra a página completa de compartilhamento do Primuse, e não JSON:

- **Link por código curto**: `https://<domínio>/s/123456#k=<chave-de-descriptografia>`. O código pode ter de 4 a 6 dígitos, com 6 por padrão, e duração máxima de 24 horas. O código é apenas um identificador temporário; não é senha nem chave de descriptografia. Se você compartilhar apenas o código oralmente, a chave precisa ser enviada por outro canal seguro.
- **Link seguro permanente**: `https://<domínio>/s/<token-não-enumerável>#k=<chave-de-descriptografia>`. Usa um token aleatório de alta entropia e não expira automaticamente. Só deixa de funcionar quando o autor revoga o link ou um administrador o remove. É indicado para compartilhamentos de longa duração.

- Na primeira abertura, a página mostra apenas um estado genérico de compartilhamento criptografado. O navegador lê a chave em `#k=` no URL ou aceita que o usuário cole manualmente a chave ou o link completo. Só após a validação local são exibidos música, artista, álbum, formato, qualidade, nome do arquivo e botões de ação.
- O manifesto criptografado é lido em `/s/<token>/manifest`; os blocos de mídia cifrada ficam em `/s/<token>/chunks/<índice>`. O WebCrypto autentica e descriptografa cada bloco com AES-256-GCM no navegador e então usa um Blob local para reproduzir ou baixar. Em compartilhamentos criptografados pelo cliente, `/media` e `/download` nunca retornam mídia em texto claro.
- **Abrir no Primuse** primeiro chama `POST /s/<token>/import` na mesma origem para emitir um `/i/<token-temporário>` válido por 10 minutos e utilizável uma única vez. Esse token é entregue ao app via `primuse://import-share?...`. O app baixa o conteúdo cifrado, descriptografa localmente e depois importa o arquivo. O token temporário não inclui a senha do compartilhamento, e a chave de descriptografia continua existindo apenas no fragmento do URL.
- Compartilhamento do sistema, copiar link, salvar QR Code, aviso de privacidade e confirmação de downloads grandes acontecem na própria página. Para links criptografados, copiar, compartilhar e gerar QR Code inclui o `#k=` completo; essas ações ficam indisponíveis antes de a chave ser validada.
- Compartilhamentos inexistentes, expirados ou revogados retornam a mesma página HTTP 410, sem revelar ao visitante o estado específico nem informações sobre a música.

Por compatibilidade, compartilhamentos antigos em que o relay gerenciava a criptografia continuam acessíveis por `/media`, `/download` e requisições Range. Um compartilhamento criptografado no cliente nunca cai para uma resposta de mídia em texto claro nesses endpoints. A página web e os assets estáticos também usam cabeçalhos de segurança restritivos e desabilitam indexação.

No protocolo de criação, links curtos usam `linkType: "short"` e enviam `expiresAt`. Links permanentes usam `linkType: "permanent"` e não podem enviar `expiresAt`. As respostas de criação e conclusão retornam explicitamente o booleano `permanent`; links permanentes não retornam `expiresAt`. Clientes antigos que omitam `linkType` ou usem `"long"` continuam criando links de alta entropia, mas com validade limitada, para preservar compatibilidade. A interface nova não oferece mais esse modo ambíguo.

## Regras de segurança

- `ADMIN_TOKEN` e `MASTER_KEY` devem existir apenas como Secrets de runtime. Não coloque esses valores em imagens, repositórios de configuração, argumentos de linha de comando ou logs. Em instalações próprias, o administrador salva `ADMIN_TOKEN` no Keychain do seu Primuse. No serviço oficial, esse token é usado exclusivamente em operações do servidor e nunca distribuído aos usuários do app.
- `ADMIN_TOKEN` deve ter pelo menos 32 bytes aleatórios. `MASTER_KEY` deve ser o Base64 de 32 bytes aleatórios.
- O Primuse atual gera uma chave aleatória de 256 bits separada para cada compartilhamento. Áudio e manifesto, incluindo nome do arquivo, título, artista, álbum e outros metadados, são criptografados com AES-256-GCM antes do upload. Cada bloco usa um nonce aleatório próprio e inclui ID do compartilhamento, índice do bloco e tamanho do plaintext como dados autenticados.
- A chave de descriptografia aparece apenas no fragmento `#k=` do URL. Por definição do navegador, o fragmento não é enviado na requisição HTTP e portanto não chega ao Worker, proxy reverso, R2 ou logs do servidor. O servidor conhece apenas dados de controle do compartilhamento, tamanho total do plaintext, tamanho dos blocos e objetos cifrados.
- Criptografia ponta a ponta na web ainda confia no HTML/JavaScript entregue naquele acesso. Se a conta de deploy ou o Worker for comprometido, um script malicioso pode ler o fragmento. Proteja as permissões de publicação na Cloudflare/servidor e audite mudanças no frontend. Para cenários de alta sensibilidade, prefira que ambos os lados usem versões confiáveis do cliente nativo do Primuse.
- O serviço oficial `share.soundisle.com` exige criptografia no cliente. Em self-host, use `PRIMUSE_RELAY_E2EE_POLICY=required|optional|disabled`. O padrão é `required`. `optional` aceita os dois formatos, embora o Primuse atual continue preferindo criptografia no cliente. Somente `disabled` faz o cliente atual voltar ao modelo antigo de criptografia gerenciada pelo relay.
- Um PAT do Docker Hub deve ser usado apenas no `docker login`. Não o escreva neste documento, Dockerfile, Compose ou Git.
- Qualquer PAT que tenha aparecido em chat, saída de terminal ou logs deve ser revogado após o deploy e recriado com o menor conjunto de permissões necessário.
- `MASTER_KEY` continua sendo usada para sessões de acesso e compartilhamentos antigos criptografados pelo relay. Ela não é a chave de mídia dos compartilhamentos novos. Mantenha seu backup separado dos dados. Perder ou trocar essa chave afeta links antigos e sessões de validação já existentes, mas o servidor já não consegue recuperar mídia criptografada no cliente.
- IDs de compartilhamento, tokens de revogação, tokens de upload e chaves de objetos de mídia sempre usam valores aleatórios de alta entropia. Códigos curtos são reservados atomicamente e, em caso de colisão, um novo código é gerado. O índice em disco/R2 usa apenas o hash do código como chave e não salva o código nem a senha em claro.
- Metadados de links permanentes não usam uma data de expiração fictícia distante. O ciphertext concluído não entra na fila de limpeza por vencimento; ele só pode ser removido por revogação ou limpeza administrativa. Metadados legados que possuem `expiresAt` continuam seguindo a semântica original.
- **Desabilitar download não é DRM.** Essa opção controla a interface e os endpoints do produto. Se o navegador está autorizado a reproduzir, o destinatário autorizado consegue obter plaintext reproduzível no próprio dispositivo. Não descreva essa permissão como uma barreira técnica contra cópia.

## Opção 1: Docker self-hosted

### 1. Preparar a configuração

```bash
cd ShareRelay
cp relay.env.example relay.env
chmod 600 relay.env
```

Edite `relay.env`:

```dotenv
PRIMUSE_RELAY_PUBLIC_BASE_URL=https://share.example.com
PRIMUSE_RELAY_E2EE_POLICY=required
PRIMUSE_RELAY_MASTER_KEY=<resultado de openssl rand -base64 32>
PRIMUSE_RELAY_ADMIN_TOKEN=<resultado de openssl rand -hex 32>
```

Se houver necessidade real de compatibilidade, o administrador de uma instalação própria pode alterar a política:

```dotenv
# required: aceita apenas criptografia ponta a ponta no cliente (padrão recomendado)
# optional: aceita criptografia no cliente e upload legado; Primuse atual continua preferindo criptografia
# disabled: desativa criptografia no cliente e usa criptografia estática no servidor
PRIMUSE_RELAY_E2EE_POLICY=optional
```

A política afeta apenas novos compartilhamentos; ela não converte dados já salvos. O cliente consulta primeiro `GET /.well-known/primuse-share` e envia o conteúdo de acordo com a política declarada pelo serviço.

Não copie literalmente para a configuração os comandos que aparecem entre `<...>`. Execute-os separadamente em um terminal seguro, salve os resultados em um gerenciador de senhas e então preencha o `relay.env`. O arquivo `relay.env` já é ignorado pelo Git.

### 2. Executar uma imagem publicada

Imagem padrão:

```text
docker.io/kkape/primuse-share-relay
```

A versão pública de referência existente é `2026.09.03`; `latest` aponta para o mesmo manifesto multi-arquitetura amd64/arm64:

```bash
docker pull docker.io/kkape/primuse-share-relay:2026.09.03
```

Essa referência não contém o novo protocolo de código curto. Para implantar o código atual, gere uma nova tag baseada no hash do commit conforme a seção seguinte e, depois do pull, registre o digest atual com `docker buildx imagetools inspect`. Não acompanhe `latest` permanentemente em produção.

Se o Caddy incluído no repositório for responsável pelo HTTPS, abra TCP 80 e TCP/UDP 443 e aponte o DNS do domínio para o servidor:

```bash
PRIMUSE_RELAY_IMAGE=docker.io/kkape/primuse-share-relay:<tag-imutável> \
PRIMUSE_RELAY_DOMAIN=share.example.com \
docker compose --profile public pull

PRIMUSE_RELAY_IMAGE=docker.io/kkape/primuse-share-relay:<tag-imutável> \
PRIMUSE_RELAY_DOMAIN=share.example.com \
docker compose --profile public up -d
```

Se Nginx, Caddy, Traefik ou Cloudflare Tunnel já fizer o proxy externo, execute apenas o relay preso ao localhost e encaminhe HTTPS para `127.0.0.1:8787`:

```bash
PRIMUSE_RELAY_IMAGE=docker.io/kkape/primuse-share-relay:<tag-imutável> \
docker compose pull relay

PRIMUSE_RELAY_IMAGE=docker.io/kkape/primuse-share-relay:<tag-imutável> \
docker compose up -d relay
```

Validação:

```bash
curl --fail --silent --show-error https://share.example.com/healthz
docker compose ps
```

Resposta esperada:

```json
{"status":"ok"}
```

No Primuse, em **Serviço de compartilhamento**, escolha **Serviço próprio**, informe o endereço HTTPS público e `PRIMUSE_RELAY_ADMIN_TOKEN`. A escolha, o endereço e a credencial administrativa são lembrados após o primeiro uso; o token administrativo fica apenas no Keychain local.

### 3. Backup e atualização

- O volume `relay_data` contém mídia cifrada e informações de controle em hash; faça backups consistentes regularmente.
- `relay.env` não deve ser armazenado junto de backups de dados em um local público.
- Para atualizar, primeiro faça pull de uma imagem com digest ou tag imutável e depois execute `docker compose up -d`.
- Para rollback, volte `PRIMUSE_RELAY_IMAGE` à tag anterior. Não remova `relay_data`.

### 4. Build e push para Docker Hub

Crie primeiro o repositório `primuse-share-relay` no namespace `kkape` do Docker Hub e escolha a visibilidade. Faça login de forma interativa para evitar que o PAT entre no histórico do shell:

```bash
docker login --username kkape
```

Cole o PAT com permissão de escrita quando o CLI solicitar `Password`. Em seguida, a partir da raiz do repositório, gere e publique imagens amd64 e arm64:

```bash
IMAGE=docker.io/kkape/primuse-share-relay
VERSION=$(git rev-parse --short=12 HEAD)

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --file ShareRelay/Dockerfile \
  --tag "$IMAGE:$VERSION" \
  --tag "$IMAGE:latest" \
  --provenance=true \
  --sbom=true \
  --push \
  ShareRelay

docker buildx imagetools inspect "$IMAGE:$VERSION"
```

Em produção, fixe `$VERSION` ou o digest da imagem no Compose em vez de acompanhar `latest`.

Referências oficiais do Docker: [push de imagens](https://docs.docker.com/docker-hub/repos/manage/hub-images/push/), [build multi-plataforma](https://docs.docker.com/build/building/multi-platform/) e [PAT](https://docs.docker.com/security/access-tokens/).

## Opção 2: Cloudflare Worker + R2

### Arquitetura e recursos

Recursos fixos usados por esta opção:

- Worker: `primuse-share-relay`
- Bucket R2 privado: `primuse-share-relay`
- Custom Domain: `share.soundisle.com`
- Código-fonte/configuração do Worker: `ShareRelay/cloudflare/`
- Assets estáticos da página: `ShareRelay/web/`, fornecidos pelo binding `ASSETS` de Workers Static Assets
- Limite de requisições públicas: 600/min por IP de origem em cada localização de borda da Cloudflare
- Tentativas de senha: 5/min por compartilhamento e IP
- Requisições de código curto: 60/min por combinação IP + código em cada localização de borda
- Limite total de códigos curtos: 60/min por IP em cada localização de borda, para evitar evasão trocando o código
- Falhas em código curto: 5/min por combinação IP + código
- Criação anônima de compartilhamento criptografado: 10/min por IP em cada localização de borda
- Limpeza: a cada 5 minutos examina um shard aleatório de IDs; links temporários deixam de responder imediatamente ao expirar e são removidos de forma assíncrona; links permanentes nunca são removidos por idade

Antes do upload, o Primuse criptografa manifesto e blocos de mídia com AES-256-GCM. O Worker não possui a chave de descriptografia do compartilhamento. Ele grava os bytes cifrados recebidos diretamente em R2 privado: o manifesto cifrado é um objeto separado, e os blocos de mídia são reunidos em um único objeto via R2 Multipart Upload. A página busca intervalos desse objeto e descriptografa localmente no navegador. O bucket não possui domínio público; toda leitura passa pelas verificações de token de capacidade, estado e permissões do Worker.

O plano Free dos Workers possui orçamento de CPU apertado, e a validação de senha executa 210.000 iterações de PBKDF2. Para produção, recomenda-se Workers Paid e confirmação prévia de que R2 está ativado e que alertas de cobrança estão configurados.

### 1. Validar localmente

Os testes JavaScript podem ser executados sem instalar dependências:

```bash
cd ShareRelay
node --check web/share.js
node --check cloudflare/src/index.mjs
node --test cloudflare/test/index.test.mjs
```

O deploy requer Wrangler 4.36.0 ou superior; a versão usada na validação atual é 4.128.0:

```bash
cd ShareRelay/cloudflare
npx wrangler@4.128.0 --version
npx wrangler@4.128.0 whoami
```

### 2. Criar o bucket R2 privado

```bash
npx wrangler@4.128.0 r2 bucket list
npx wrangler@4.128.0 r2 bucket create primuse-share-relay
```

Buckets R2 são privados por padrão. Não habilite `r2.dev` nem R2 Public Custom Domain.

### 3. Gravar Secrets uma única vez

Os comandos abaixo geram dois valores aleatórios independentes apenas em memória e os enviam à Cloudflare pela entrada padrão, sem criar arquivo de Secret em texto claro:

```bash
ADMIN_TOKEN=$(openssl rand -hex 32)
MASTER_KEY=$(openssl rand -base64 32)

printf '%s\0%s' "$ADMIN_TOKEN" "$MASTER_KEY" \
  | jq -Rs 'split("\u0000") | {ADMIN_TOKEN: .[0], MASTER_KEY: .[1]}' \
  | npx wrangler@4.128.0 secret bulk
```

Antes de limpar as variáveis, salve `ADMIN_TOKEN` em um gerenciador de senhas acessível apenas à operação do serviço. O serviço oficial não grava esse token no Primuse nem o fornece aos usuários; ele é usado apenas para revogação administrativa de emergência.

`MASTER_KEY` também não precisa ser enviada ao cliente, mas ainda é usada por sessões de acesso, fluxo de senha e compatibilidade com compartilhamentos antigos. Mantenha uma cópia separada para recuperação de desastre. A chave de mídia de cada compartilhamento novo é gerada pelo Primuse e não é essa `MASTER_KEY`.

Depois de salvar:

```bash
unset ADMIN_TOKEN MASTER_KEY
```

`wrangler secret bulk` cria e publica uma nova versão do Worker. Depois de gravados, os Secrets não podem ser lidos de volta pelo painel da Cloudflare nem pelo Wrangler.

### 4. Publicar o Worker e o domínio

```bash
npx wrangler@4.128.0 deploy --strict
```

`wrangler.jsonc` usa Worker Custom Domain e publica `ShareRelay/web/` como diretório de assets estáticos. A Cloudflare cria o registro DNS e emite o certificado automaticamente para `share.soundisle.com`. O mesmo hostname não pode ser simultaneamente um CNAME nem estar vinculado a outro Worker. Se ele já estiver ocupado, identifique o uso atual antes de alterá-lo.

Valide:

```bash
curl --fail --silent --show-error https://share.soundisle.com/healthz
npx wrangler@4.128.0 deployments list
npx wrangler@4.128.0 secret list
```

No Primuse, selecione:

```text
Serviço de compartilhamento: serviço integrado
```

O app passa a usar `https://share.soundisle.com` sem expor endereço de API ou token administrativo. `ADMIN_TOKEN` continua existindo somente como Secret do servidor e no cofre de senhas operacional.

Antes de disponibilizar o serviço para outras pessoas, faça pelo menos um teste real com arquivo pequeno cobrindo criação, upload, reprodução web, Range, desbloqueio por senha, permissão de download, importação de uso único e revogação.

Na configuração oficial, `E2EE_POLICY` deve permanecer em `required`. Para conferir a política publicada:

```bash
curl --fail --silent --show-error \
  https://share.soundisle.com/.well-known/primuse-share
```

A resposta deve incluir `"protocolVersion":4`, `"clientSideEncryption":"required"`, `"uploadAuthentication":"none"` e `client-aes-256-gcm-chunks-v1`.

### 5. Limites operacionais

- Links temporários deixam de aceitar novas requisições ao expirar, e qualquer link deixa de aceitar novas requisições assim que é revogado. Uma resposta que já começou em um edge pode continuar até o fim daquela requisição.
- Acessar um link expirado provoca limpeza imediata. O job agendado percorre 64 shards de IDs; com pouco tráfego, apagar o ciphertext pode acontecer algumas horas depois de o link já estar inválido.
- Multipart Uploads de R2 não concluídos também são automaticamente abortados após 7 dias pela regra padrão do bucket.
- Worker Observability está desativado para evitar que tokens de capacidade apareçam em logs de URL brutos. Se Logs ou Logpush forem habilitados no futuro, o caminho `/s/<token>` deve ser redigido.
- O binding de Rate Limiting da Cloudflare é um limitador aproximado por localização de borda, não um sistema de quota global ou faturamento preciso.
- Metadados em R2 guardam apenas hashes SHA-256 de tokens públicos e de controle. Objetos de mídia e manifesto contêm ciphertext produzido pelo cliente. R2, Secrets do Worker e banco do serviço não possuem a chave `#k=` de cada compartilhamento.

Referências oficiais da Cloudflare: [Custom Domains](https://developers.cloudflare.com/workers/configuration/routing/custom-domains/), [API de R2 em Workers](https://developers.cloudflare.com/r2/api/workers/workers-api-reference/), [Multipart Upload](https://developers.cloudflare.com/r2/api/workers/workers-multipart-usage/), [Workers Secrets](https://developers.cloudflare.com/workers/configuration/secrets/) e [limites dos Workers](https://developers.cloudflare.com/workers/platform/limits/).

## Configuração no celular e permissões de compartilhamento

O Primuse não descobre automaticamente o relay por broadcast na LAN ou por `.well-known`; ele usa a mesma API HTTPS para todos os serviços. No primeiro uso:

1. Abra o menu **Mais** em uma música ou na tela de reprodução.
2. Use a única entrada **Compartilhar**. **Compartilhar informações da música** envia apenas texto; **Criar link de reprodução** cria um endereço web acessível.
3. O modo de link padrão é **Automático**. Quando a fonte possui compartilhamento nativo, o Primuse tenta primeiro o link do próprio servidor. Se não houver suporte ou a criação falhar, o app explica o motivo e pergunta se deve usar o serviço de compartilhamento do Primuse; ele não envia a música nem altera permissões silenciosamente. Também é possível escolher manualmente **Servidor de música** ou **Serviço de compartilhamento do Primuse**. Fontes Navidrome/OpenSubsonic continuam oferecendo a segunda opção.
4. Em **Serviço de compartilhamento**, escolha **Serviço integrado** ou **Serviço próprio**. O serviço integrado usa diretamente `https://share.soundisle.com` e não mostra endereço nem chave administrativa. Somente uma instalação própria pede endereço HTTPS e `ADMIN_TOKEN`. Depois do primeiro uso, o app memoriza a escolha e o endereço self-hosted; o token administrativo fica no Keychain local. Antes do upload, o app lê as capacidades do serviço. O serviço oficial exige criptografia no cliente; uma instalação `optional` também recebe criptografia no cliente por padrão. O cliente só cai para criptografia gerenciada pelo relay se o self-host declarar explicitamente `disabled`.
5. Escolha **Link por código curto** ou **Link seguro permanente**. O código pode ter 4, 5 ou 6 dígitos, com 6 por padrão, e dura no máximo 24 horas. O link permanente usa token não enumerável e continua válido até revogação. A senha de acesso é independente do tipo de link; ambos podem ser **Público** ou **Protegido por senha**.
6. Links curtos exigem validade. Links permanentes mostram explicitamente **Permanente, até revogação**. Depois escolha separadamente **Reproduzir online**, **Baixar arquivo original** e **Importar no Primuse**; pelo menos uma ação precisa estar liberada. O Primuse lê a mídia original por Range usando o conector da música, criptografa manifesto e blocos no dispositivo e envia apenas ciphertext. O link completo, incluindo `#k=`, e o token de revogação são guardados no Keychain local.
7. A tela de sucesso permite copiar o link completo, abrir a folha de compartilhamento do sistema, mostrar QR Code com o endereço completo ou revogar. Ao abrir no Safari, o destinatário usa automaticamente a chave do fragmento. Se recebeu apenas endereço base e chave separadamente, pode colar a chave ou o link completo na página. **Abrir no Primuse** entrega ao app instalado a credencial de importação de uso único junto da chave do fragmento; o app baixa o ciphertext, autentica e descriptografa localmente, valida tipo/tamanho do arquivo, importa em **Música local** e agenda a atualização da biblioteca.

O relay é oferecido apenas para fontes locais ou de rede com tamanho conhecido e leitura por Range. Conteúdo DRM do Apple Music, descritores de stream, faixas CUE virtuais, itens com tamanho desconhecido e fontes sem API de leitura disponível não mostram a opção.

O modelo de acesso é semelhante ao compartilhamento opcionalmente protegido por senha do Navidrome, mas não existe conta de usuário nem ACL de amigos:

- **Público**: qualquer pessoa com o link permanente completo e a chave correta, ou com código curto + chave, consegue usar as operações liberadas pelo autor. O serviço não lista links e não conhece música, URL da fonte, credenciais do NAS ou chave de descriptografia. O código curto é enumerável, mas descobrir o código sozinho não permite descriptografar; ele continua limitado a 24 horas e protegido por rate limits.
- **Protegido por senha**: a senha adiciona uma camada de autorização no servidor além do link aleatório e da chave. O navegador mostra primeiro uma página genérica sem metadados da música. Após validação, o servidor emite Cookie de sessão de 30 minutos com `HttpOnly` e `SameSite=Strict`. O relay guarda apenas hash PBKDF2 da senha; o Primuse não persiste a senha em claro, e ela não entra no link nem no QR Code. Mesmo depois da senha correta, a chave `#k=` continua obrigatória para descriptografar.
- **Permissões de operação**: reproduzir, baixar e importar são independentes. Bloquear download não bloqueia reprodução sob demanda; importar sempre exige uma credencial temporária de uso único emitida pela página na mesma origem.
- Os dois modos respeitam a duração escolhida e podem ser revogados a qualquer momento em **Links gerenciados**. Quando um código curto expira ou qualquer link é revogado, novas páginas, reproduções, downloads e importações são recusados imediatamente.

Portanto, **Público** versus **Protegido por senha** controla quem pode obter ciphertext do serviço. `#k=` controla quem consegue transformá-lo em conteúdo. **Privado** aqui não significa “visível apenas para usuários específicos do Primuse/Navidrome”. Autorização por conta, grupo ou sessão exigiria a integração de um sistema de identidade separado.

## Alternar entre Docker e Cloudflare

As duas opções não podem ocupar `share.soundisle.com` ao mesmo tempo. Antes de migrar, pare de criar novos compartilhamentos, aguarde o encerramento ou revogue links existentes e então altere no Primuse entre **Serviço integrado** e **Serviço próprio**.

Mesmo usando a mesma `MASTER_KEY`, as duas implementações não migram automaticamente metadados, ciphertext nem URLs existentes. Cada compartilhamento novo criptografado no cliente também depende de uma chave individual que existe apenas no link completo e no dispositivo do autor.
