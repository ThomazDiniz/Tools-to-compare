system "Bazooca", {

    usecase "Administrador De Ecommerce Edita Operador De Ecommerce", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

        actor AdminEcommerce, "Usuario Administrador"
        actor system, "Bazooca"
        
        preCondition "Administrador logado no sistema; Operadores de Ecommerce cadastrados."

        basicFlow {
            step 1, AdminEcommerce,  "seleciona a opcao 'Meu Ecommerce' no menu da tela principal" 
            step 2, system,          "abre a tela de edicao do Ecommerce"
            step 3, AdminEcommerce,  "seleciona o operador na lista de operadores"
            step 4, system,          "abre os campos de edicao do Operador"
            step 5, AdminEcommerce,  "adiciona os novos dados do Operador e clica no botao 'Atualizar'", af:[1]
            step 6, system,          "salva o novo operador com os novos dados", ef:[1,2,3,4,5,6]
        }

        alternative 1, "Cancela edicao de operador", {
            step 1, AdminEcommerce, "clica no botao Cancelar", bfs:2
        }

        exception 1, "Dado obrigatorio'", { 
            step 1, system,         "informa que os dados obrigatorios devem ser preenchidos"
            step 2, AdminEcommerce,  "adiciona os dados obrigatorios e clica no botao 'Atualizar'", bfs:6
        } 

        exception 2, "Nome cadastrado", { 
            step 1, system, "alerta que ja existe um Operador cadastrado com o nome de usuario informado"
            step 2, AdminEcommerce,  "corrige o nome para o Operador e clica no botao 'Atualizar'", bfs:6
        }

        exception 3, "Email cadastrado", { 
            step 1, system, "alerta que ja existe um Operador cadastrado com o email informado"
            step 2, AdminEcommerce,  "corrige o email e clica no botao 'Atualizar'", bfs:6
        }

        exception 4, "Email invalido", { 
            step 1, system, "alerta que ja existe um Operador cadastrado com o email informado"
            step 2, AdminEcommerce,  "corrige o email e clica no botao 'Atualizar'", bfs:6
        }

        exception 5, "Cpf cadastrado", { 
            step 1, system, "alerta que ja existe um Operador cadastrado com o cpf informado"
            step 2, AdminEcommerce,  "corrige o cpf e clica no botao 'Atualizar'", bfs:6
        }

        exception 6, "Senhas diferentes", { 
            step 1, system, "alerta que as senhas informadas nao coincidem"
            step 2, AdminEcommerce,  "corrige as senhas e clica no botao 'Atualizar'", bfs:6
        }

        postCondition "Operador de Ecommerce modificado no sistema." 
    } 
}
