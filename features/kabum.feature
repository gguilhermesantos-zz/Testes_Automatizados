#language: pt
Funcionalidade:Fluxo principal
    Para verificar o fluxo principal do site
    
    @FluxoCritico
    Cenario: Fluxo de ponta a ponta do site Kabum
        Dado que eu acesse o site
        Quando eu faço uma busca por "Cadeira Gamer Fortrek Blackfire"
        Então eu valido o retorno da busca
        Quando eu escolho o produto na lista
            E eu adiciono o produto ao carrinho
        Então eu valido se o produto foi enviado para o carrinho com sucesso