Dado('que eu acesse o site') do
    #Acessa o site
    visit 'https://kabum.com.br'
end

E('eu faço uma busca por {string}') do |produto|
    @produto = produto
    #Verificacao do campo de busca
    find('.sprocura').set produto
    if (('.sprocura').empty?)
        p "Erro ao preencher a busca"
    end
    find('#bt-busca').click
end

E('eu valido o retorno da busca') do
    #Verificacao da lista de produto
    if (find_all('.sc-fzqNqU.jmuOAh', minimum: 1))
        p "O item procurado existe"
    else
        p "O item procurado nao existe"
    end
    within('#listagem-produtos') do
        link_detalhe = find_all('.sc-AxhUy.kMyssT')
        link_nome = find_all('.sc-fzoLsD.gnrNhT.item-nome')
        @nome_item = link_nome.first['text']
        p "O item selecionado foi: " + @nome_item
        #verificacao do link referente ao botao de "Detalhes"
        if (link_detalhe.first['href'] == nil)
            p "Erro no link do detalhe do produto"
        end
        #verificacao do link referente ao nome do produto
        if (link_nome.first['href'] == nil)
            p "Erro no link do nome do produto"
        end
    end
end

Quando('eu escolho o produto na lista') do
    #Escolhendo o Primeiro item
    within('#listagem-produtos') do
        itens = find_all('.sc-AxhUy.kMyssT')
        itens.first.click
    end
end

E('eu adiciono o produto ao carrinho') do
    if (find('#titulo_det', text: @nome_item))
        find('.botao-comprar').click
    else
        p "Erro ao selecionar o produto"
    end

end

Então('eu valido se o produto foi enviado para o carrinho com sucesso') do
    #tempo para a pagina terminar de carregar
    sleep 2
    #verificacao do item selecionado
    if (find('.sc-AxgMl.hDters', text: @nome_item))
        p "Item selecionado esta correto"
    else
        p "Item selecionado nao esta correto"
    end
    #verificacao do texto da pagina, referente ao status do item
    if (find('.sc-fzoyTs.boZXnd', text: "ESTE PRODUTO FOI ADICIONADO AO CARRINHO"))
        p "Confirmacao de item adicionado no carrinho com sucesso"
    else
        p "Erro ao adicionar item no carrinho"
    end

    find('.sc-fzpmMD.gzOXOW').click
    #verificacao do texto da pagina, referente ao status do item (pagina do carrinho)
    within('.sc-fOICqy.yZmkT') do
        if (find('.sc-dxgOiQ.hbBAeo', text: "Produtos adicionados ao carrinho"))
            p "O item esta no carrinho"
        else
            p "o item nao esta no carrinho"
        end
    end
    #verificacao do item selecionado (pagina do carrinho)
    if (find('.sc-eXEjpC.dwxlSw', text: @nome_item))
        p "Item selecionado esta no carrinho"
    else
        p "Item selecionado nao esta no carrinho"
    end
end
