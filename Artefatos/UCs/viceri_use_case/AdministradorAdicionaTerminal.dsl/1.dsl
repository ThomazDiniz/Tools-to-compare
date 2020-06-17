system "Bazooca", {
    
    usecase "Administrador Adiciona Terminal", {

        version "1.0", type:"Creation", user:"SPLab", date:"07/02/2017"

        actor Administrador, "Usuario Administrador"
        actor system, "Bazooca"

        preCondition "Usuario Administrador esta logado no sistema."

        basicFlow {
            step 1, Administrador,  "abre tela inicial do sistema"
            step 2, system,         "exibe tela inicial do sistema"
            step 3, Administrador,  "clica no opcao 'Terminais' no menu principal"
            step 4, system,         "exibe a tela com a lista de Terminais cadastrados no sistema"
            step 5, Administrador,  "clica no botao 'Adicionar Terminal'", af:[1]
            step 6, system,         "exibe tela de cadastro de Terminal"
            step 7, Administrador,  "insere os dados de cadastro do Terminal e clica no botao 'Cadastrar'", af:[2]
            step 8, system,         "notifica usuario de que Terminal foi cadastrado com sucesso e exibe lista de Terminais", ef:[1,2]
        }

        alternative 1, "Volta para tela inicial do sistema", {
            step 1, Administrador, "clica no botao 'Voltar'", bfs:2
        }

        alternative 2, "Cancela registro de Terminal", {
            step 1, Administrador, "clica no botao 'Cancelar'", bfs:4
        }

        exception 1, "Nao preenche algum campo obrigatorio", {
            step 1, system,         "alerta ao usuario que os campos obrigatorios devem ser preenchidos"
            step 2, Administrador,  "informa os campos obrigatorios e clica no botao de 'Cadastrar'", bfs:8
        } 

        exception 2, "Conflito de CNPJ", {
            step 1, system, "alerta que ja existe um Terminal cadastrado com o CNPJ"
            step 2, Administrador,  "preenche o CNPJ correto e clica no botão 'Cadastrar'", bfs:8
        }

        postCondition "O novo Terminal esta salvo no sistema."

    } 
}

