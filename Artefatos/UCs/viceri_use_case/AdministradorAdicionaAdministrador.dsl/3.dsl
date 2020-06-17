system "Bazooca", {

    usecase "Administrador Adiciona Administrador", {

        version "1.0", type:"Create", user:"SPLab", date:"03/02/2017"

        actor Administrador, "Usuario Administrador"
        actor system, "Bazooca"

        preCondition "Usuario Administrador esta logado no sistema."

        basicFlow {
            step 1, Administrador,  "clica na opcao 'Administrador' no menu da tela principal"
            step 2, system,         "apresenta uma listagem dos Administradores cadastrados no sistema"
            step 3, Administrador,  "clica no botao 'Adicionar Administrador'"
            step 4, system,         "abre a tela de cadastro de Administradores"
            step 5, Administrador,  "preenche os dados do Administrador, seleciona suas permissoes e clica no botao 'Registrar'"
            step 6, system,         "notifica que o Administrador foi adicionado com sucesso", ef:[1,2,3,4]
        }

        exception 1, "Dados obrigatorios'", { 
            step 1, system,         "informa que os dados obrigatorios devem ser preenchidos"
            step 2, Administrador,  "preenche os dados orbigatorios e clica no botao 'Registrar'", bfs:6
        } 

        exception 2, "Email invalido", {
            step 1, system,         "alerta usuario de que Email e invalido"
            step 2, Administrador,  "insere um Email valido e clica no botao 'Registrar'", bfs:6
        }

        exception 3, "Senha e Confirmacao diferentes", {
            step 1, system,         "alerta usuario de que senhas estao diferentes"
            step 2, Administrador,  "insere Senhas iguais e clica no botao 'Registrar'", bfs:6
        }

        exception 4, "Sem Permissao", {
            step 1, system,         "alerta usuario que Administrador nao esta com nenhuma Permissao"
            step 2, Administrador,  "insere uma permissao e clica no botao 'Registrar'", bfs:6
        }

        postCondition "O Administrador foi adicionado com sucesso."
    }
}