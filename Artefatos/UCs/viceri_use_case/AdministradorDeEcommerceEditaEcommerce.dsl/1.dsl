system "Bazooca", {

    usecase "Administrador De Ecommerce Edita Ecommerce", {

        version "1.0", type:"Create", user:"SPLab", date:"03/02/2017"

        actor AdminEcommerce, "Usuario Administrador de Ecommerce"
        actor system, "Bazooca"

        preCondition "Usuario Administrador esta logado no sistema. Existe pelo menos um Ecommerce registrado."

        basicFlow {
            step 1, AdminEcommerce,   "abre tela inicial do sistema"
            step 2, system,           "exibe tela inicial do sistema"
            step 3, AdminEcommerce,   "seleciona a opcao 'Meu Ecommerce' no menu da tela principal" 
            step 4, system,           "abre a tela de edicao do Ecommerce"
            step 5, AdminEcommerce,   "preenche os novos dados do Ecommerce e clica no botao 'Atualizar'", af:[1]
            step 6, system,           "notifica que o Administrador foi adicionado com sucesso", ef:[1,2,3,4]
        }

        alternative 1, "Cancela registro de Administrador", {
            step 1, AdminEcommerce, "clica no botao Cancelar", bfs:2
        }

        exception 1, "Dados obrigatorios'", { 
            step 1, system,         "informa que os dados obrigatorios devem ser preenchidos"
            step 2, AdminEcommerce,  "preenche os dados orbigatorios e clica no botao 'Atualizar'", bfs:6
        } 

        exception 2, "Email invalido", {
            step 1, system,         "alerta usuario de que Email e invalido"
            step 2, AdminEcommerce,  "insere um Email valido e clica no botao 'Atualizar'", bfs:6
        }

        exception 3, "Senha e Confirmacao diferentes", {
            step 1, system,         "alerta usuario de que senhas estao diferentes"
            step 2, AdminEcommerce,  "insere Senhas iguais e clica no botao 'Atualizar'", bfs:6
        }

        exception 4, "Sem Permissao", {
            step 1, system,         "alerta usuario que Administrador nao esta com nenhuma Permissao"
            step 2, AdminEcommerce,  "insere uma permissao e clica no botao 'Atualizar'", bfs:6
        }

        postCondition "O Ecommerce foi atualizado com sucesso."
    }
}
