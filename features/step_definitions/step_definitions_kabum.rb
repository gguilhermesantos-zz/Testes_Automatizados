Dado('que eu acesse o site') do
    visit 'https://kabum.com.br'
end

Quando('eu faço uma busca por {string}') do |produto|
    @produto = produto
    find('.sprocura').set produto
    if (('.sprocura').empty?)
        p "Erro ao preencher a busca"
    end
    find('#bt-busca').click
end

Então('eu valido o retorno da busca') do
    if (find('#listagem-produtos', text: @produto)) && (find_all('.sc-fzqNqU.jmuOAh', minimum: 1))
        p "Existe o item procurado"
    else
        p "Nao existe o item procurado"
    end
    within('#listagem-produtos') do
        link_detalhe = find_all('.sc-AxhUy.kMyssT')
        link_nome = find_all('.sc-fzoLsD.gnrNhT.item-nome')
        @nome_item = link_nome.first['text']
        p "O item selecionado foi: " + @nome_item
        if (link_detalhe.first['href'] == nil)
            p "Erro no link do detalhe do produto"
        end
        if (link_nome.first['href'] == nil)
            p "Erro no link do nome do produto"
        end
    end
end

Quando('eu escolho o produto na lista') do
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
    sleep 2
    if (find('.sc-AxgMl.hDters', text: @nome_item))
        p "Item selecionado esta correto"
    else
        p "Item selecionado nao esta correto"
    end
    if (find('.sc-fzoyTs.boZXnd', text: "ESTE PRODUTO FOI ADICIONADO AO CARRINHO"))
        p "Mensagem de item enviado para o carrinho esta correto"
    else
        p "Erro ao enviar item ao carrinho"
    end

    find('.sc-fzpmMD.gzOXOW').click
    within('.sc-fOICqy.yZmkT') do
        if (find('.sc-dxgOiQ.hbBAeo', text: "Produtos adicionados ao carrinho"))
            p "O item esta no carrinho"
        else
            p "o item nao esta no carrinho"
        end
    end
    if (find('.sc-eXEjpC.dwxlSw', text: @nome_item))
        p "Item selecionado para o carrinho esta correto"
    else
        p "Item selecionado nao esta no carrinho"
    end
end