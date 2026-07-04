# orthanc-api

Servidor [Orthanc](https://orthanc.uclouvain.be/) de testes na nuvem, usado
como PACS de exemplo para o [MedView](https://github.com/Arilson1/MedView).

## CORS

Orthanc não tem suporte a CORS embutido (é uma decisão de design do
projeto — veja a [FAQ oficial](https://book.orthanc-server.com/faq/same-origin.html)).
Como o MedView é uma aplicação de navegador que fala direto com o PACS,
este repositório roda um `nginx` na frente do Orthanc só para adicionar os
headers `Access-Control-Allow-*` — sem isso, o navegador bloqueia toda
resposta do servidor por política de mesma origem.

- `nginx` escuta na porta `8042` (a porta exposta pelo Render) e repassa para
  o Orthanc, que roda internamente na porta `8043`.
- `start.sh` sobe os dois processos no mesmo container.

## Deploy no Render

Build via Dockerfile — sem comandos de build/start adicionais no Render, ele
já usa o `CMD` da imagem.

## Aviso

Esta instância está configurada com `AuthenticationEnabled: false` para
facilitar testes. Qualquer pessoa com a URL consegue ler e escrever exames.
Não suba dados reais de pacientes aqui — use apenas para testes de
integração com o MedView.
