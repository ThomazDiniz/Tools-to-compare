system "Bazooca", {

    usecase "Administrador Edita Ecommerce", {

        version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

        actor Administrador, "Usuario Administrador"
        actor system, "Bazooca"

        preCondition "Administrador logado; Algum E-commerce salvo no sistema."

        basicFlow {
            step 1, Administrador,  "seleciona a opcao 'E-commerce' no menu da tela principal" 
            step 2, system,         "mostra a tela de detalhes do ecommerce"
            step 3, Administrador,  "seleciona um E-commerce na lista", af:[1,2]
            step 4, system,         "abre a tela de edicao do Ecommerce"            
            step 3, Administrador,  "modifica os dados existentes"
            step 4, system,         "valida os dados cadastrais do ecommerce"
            step 5, Administrador,  "clica no botao de atualizar"
            step 6, system,         "atualiza os dados do E-commerce no sistema", ef:[1,2]
        }

        alternative 1, "Usuario ordena lista de Ecommerce", {
            step 1, Administrador, "clica em um dos botões de ordenacao associada a uma coluna da tabela", bfs:2
        }

        alternative 2, "Usuario navega por paginas de tabela", {
            step 1, Administrador, "clica em botao de navegacao de paginas de tabela", bfs:2
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
