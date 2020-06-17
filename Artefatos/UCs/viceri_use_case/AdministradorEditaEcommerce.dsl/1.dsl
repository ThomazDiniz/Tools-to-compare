system "Bazooca", {

    usecase "Administrador Edita Ecommerce", {

        version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

        actor Administrador, "Usuario Administrador"
        actor system, "Bazooca"

        preCondition "Administrador logado; Algum E-commerce salvo no sistema."

        basicFlow {
            step 1, Administrador,  "seleciona a opcao 'E-commerce' no menu da tela principal" 
            step 2, system,         "mostra a tela de detalhes do ecommerce"
            step 3, Administrador,  "seleciona um E-commerce na lista", af:[1,2,3,4]
            step 4, system,         "abre a tela de edicao do Ecommerce"            
            step 3, Administrador,  "modifica os dados existentes"
            step 4, system,         "valida os dados cadastrais do ecommerce"
            step 5, Administrador,  "clica no botao de atualizar", af:[5]
            step 6, system,         "notifica usuario de que o Ecommerce foi atualizado com sucesso", ef:[1,2]
        }

        alternative 1, "Ordena lista de Ecommerce", {
            step 1, Administrador, "clica em um dos botões de ordenacao associada a uma coluna da tabela", bfs:2
        }

        alternative 2, "Navega por paginas de tabela", {
            step 1, Administrador, "clica em botao de navegacao de paginas de tabela", bfs:2
        }

        alternative 3, "Filtra lista de Ecommerce", {
            step 1, Administrador, "preenche campos de filtragem", bfs:2
        }

        alternative 4, "Cancela atualizacao de Ecommerce", {
            step 1, Administrador, "clica no botao Cancelar", bfs:2
        }

        alternative 5, "Volta para tela inicial de sistema", {
            step 1, Administrador, "clica no botao Voltar", bfs:2
        }

        exception 1, "Nao insere algum dado obrigatório'", { 
            step 1, system, "informa que os dados obrigatórios devem ser preenchidos"
            step 2, Administrador, "adiciona dados corretos e clica em 'Atualizar", bfs:6
        }

        exception 2, "Usuario insere algum dado invalido", { 
            step 1, system, "alerta que o dado esta invalido e pede nova entrada"
            step 2, Administrador, "corrige os dados invalidos e clica em 'Atualizar", bfs:6
        }

        postCondition "Ecommerce esta com dados atualizados no sistema." 
    }
}
