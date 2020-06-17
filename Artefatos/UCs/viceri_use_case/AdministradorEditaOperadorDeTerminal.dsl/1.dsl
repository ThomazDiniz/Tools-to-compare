system "Bazooca", {

    usecase "Administrador Edita Operador De Terminal", {

        version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

        actor Administrador, "Usuario Administrador"
        actor system, "Bazooca"
        
        preCondition "Administrador logado no sistema; Operadores de Terminal cadastrados."

        basicFlow {
            step 1, Administrador,  "seleciona a opcao 'Terminais' no menu da tela principal" 
            step 2, system,         "mostra a lista de Terminais do sistema"
            step 3, Administrador,  "seleciona o Terminal do operador", af:[1,2,3,5]
            step 4, system,         "abre a tela de edicao do Terminais"
            step 5, Administrador,  "seleciona o operador na lista de operadores"
            step 6, system,         "abre os campos de edicao do Operador"
            step 7, Administrador,  "adiciona os novos dados do Operador e clica no botao 'Salvar'", af:[4]
            step 8, system,         "salva o novo operador com os novos dados", ef:[1,2,3,4,5,6]
        }

        alternative 1, "Navega pelas listas", { 
            step 1, Administrador, "procura o E-commerce navegando pelas paginas da lista", bfs:2
        }

        alternative 2, "Ordena lista de Terminal", { 
            step 1, Administrador, "ordena os E-commerces por algum atributo", bfs:2
        } 

        alternative 3, "Volta para tela inicial de sistema", {
            step 1, Administrador, "clica no botao Voltar", bfs:2
        }

        alternative 4, "Cancela edicao de operador", {
            step 1, Administrador, "clica no botao Cancelar", bfs:4
        }

        alternative 5, "Filtra lista de Terminal", {
            step 1, Administrador, "filtra lista de Terminal por algum campo", bfs:4
        }


        exception 1, "Dado obrigatorio'", { 
            step 1, system,         "informa que os dados obrigatorios devem ser preenchidos"
            step 2, Administrador,  "adiciona os dados obrigatorios e clica no botao 'Salvar'", bfs:6
        } 

        exception 2, "Nome cadastrado", { 
            step 1, system, "alerta que ja existe um Operador cadastrado com o nome de usuario informado"
            step 2, Administrador,  "corrige o nome para o Operador e clica no botao 'Salvar'", bfs:6
        }

        exception 3, "Email cadastrado", { 
            step 1, system, "alerta que ja existe um Operador cadastrado com o email informado"
            step 2, Administrador,  "corrige o email e clica no botao 'Salvar'", bfs:6
        }

        exception 4, "Email invalido", { 
            step 1, system, "alerta que ja existe um Operador cadastrado com o email informado"
            step 2, Administrador,  "corrige o email e clica no botao 'Salvar'", bfs:6
        }

        exception 5, "Cpf cadastrado", { 
            step 1, system, "alerta que ja existe um Operador cadastrado com o cpf informado"
            step 2, Administrador,  "corrige o cpf e clica no botao 'Salvar'", bfs:6
        }

        exception 6, "Senhas diferentes", { 
            step 1, system, "alerta que as senhas informadas nao coincidem"
            step 2, Administrador,  "corrige as senhas e clica no botao 'Salvar'", bfs:6
        }

        postCondition "Operador de Terminal modificado no sistema." 
    } 
}
