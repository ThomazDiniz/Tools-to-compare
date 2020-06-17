system "Bazooca", {

    usecase "Administrador Adiciona Beneficio Ao Terminal", {

        version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

        actor Administrador, "Usuario Administrador"
        actor system, "Bazooca"

        preCondition "Usuario Administrador logado no sistema. De existir pelo menos um terminal registrado."

        basicFlow {
            step 1, Administrador,  "abre tela inicial do sistema"
            step 2, system,         "exibe tela inicial do sistema"
            step 3, Administrador,  "seleciona a opcao 'Terminais' no menu da tela principal"
            step 4, system,         "mostra a lista de Terminais do sistema"
            step 5, Administrador,  "seleciona o Terminal em que sera adicionado o Beneficio", af:[1]
            step 6, system,         "abre a tela de edicao do Terminal"
            step 7, Administrador,  "adiciona os dados do novo Beneficio na secao 'Beneficios' e clica no botao 'Adicionar Beneficio'", af:[2]
            step 8, system,         "notifica usuario que o novo Beneficio foi salvo e incrementa lista de Beneficios", ef:[1]
        }

        alternative 1, "Volta para listagem de Terminais", {
            step 1, Administrador, "clica no botao Voltar", bfs:2
        }

        alternative 2, "Cancela registro de Beneficio de Terminal", {
            step 1, Administrador, "clica no botao Cancelar", bfs:4
        }

        exception 1, "Nao insere algum dado obrigatorio'", { 
            step 1, system,         "informa que os dados obrigatorios devem ser preenchidos"
            step 2, Administrador,  "adiciona os dados obrigatorios e clica no botao 'Adicionar Beneficio'", bfs:6
        } 

        postCondition "Beneficio de Terminal salvo no sistema" 
    }   
}
