system "Bazooca", {

    usecase "Administrador Adiciona Operador De Terminal", {

        version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

        actor Administrador, "Usuario Administrador"
        actor system, "Bazooca"


        preCondition "Usuario Administrador logado no sistema; Existe pelo menos um Terminal registrado."

        basicFlow {
            step 1, Administrador,  "abre tela inicial do sistema"
            step 2, system,         "exibe tela inicial do sistema"
            step 3, Administrador,  "seleciona a opcao 'Terminais' no menu da tela principal"
            step 4, system,         "mostra a lista de Terminais do sistema"
            step 5, Administrador,  "seleciona o Terminal em que sera adicionado o Operador", af:[1,3]
            step 6, system,         "abre a tela de edicao do Terminal"
            step 7, Administrador,  "adiciona os dados do novo Operador na secao 'Operadores' e clica no botao 'Adicionar Operador'", af:[2]
            step 8, system,         "salva o novo Operador e incrementa lista de Operadores", ef:[1]
        }

        alternative 1, "Volta para tela inicial de sistema", {
            step 1, Administrador, "clica no botao Voltar", bfs:2
        }

        alternative 2, "Cancela registro de Operador de Terminal", {
            step 1, Administrador, "clica no botao Cancelar", bfs:4
        }

        alternative 3, "Volta para listagem de Terminal", {
            step 1, Administrador, "clica no botao 'Voltar'", bfs:4
        }

        exception 1, "Nao insere algum dado obrigatorio'", { 
            step 1, system,         "informa que os dados obrigatorios devem ser preenchidos"
            step 2, Administrador,  "adiciona os dados obrigatorios e clica no botao 'Adicionar Operador'", bfs:6
        } 

        postCondition "Operador de Terminal salvo no sistema" 
    }   
}
