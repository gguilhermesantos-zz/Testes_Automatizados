# Teste automatizado no site da Kabum

Este repositório contém algumas checagens básicas que serão utilizadas para validar o fluxo crítico de um cliente que acessa o site da https://kabum.com.br, escolhe um produto e adiciona no carrinho.

## Configurações e instalacoes iniciais

### Sistema

Essa automação foi desenvolvida no sistema Linux (Debian 10.4) e os comandos abaixo são específicos para este sistema.

Antes das instalações, garanta que voce está com o sistema atualizado, utilizando o seguinte comando:

`sudo apt-get upgrade && sudo apt-get update`

### Baixe o repositório

Faça o download deste repositório.

### Instale o Google Chrome

A instalação do Google Chrome pode ser realizada através do site https://www.google.com/intl/pt-BR/chrome/ ou por linha de comando:

`wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb`

`apt-get install ./google-chrome-stable_current_amd64.deb`

### Instale o Ruby

Para instalar o Ruby, basta utilizar o comando:

`sudo apt-get install ruby-full`

### Cabybara, cucumber e selenium

Faça a instalação dessas bibliotecas utilizando o comando:

`bundle install`

Note que elas foram especificadas no arquivo 'Gemfile'.

## Rodando o teste

Para rodar o teste, foi criado a seguinte tag `cucumber --tags @FluxoCritico`. Dessa forma, basta digitar essa tag na linha de comando que o teste será iniciado automaticamente.

## Observações

A escrita dos passos do arquivo kabum.feature foi feita em Português, porém, por padrão, eles são feitos em Inglês e, para funcionar corretamente, note que o comando `#language: pt` foi inserido no arquivo.

O código foi comentado para melhor entendimento do que está sendo checado em cada etapa.
