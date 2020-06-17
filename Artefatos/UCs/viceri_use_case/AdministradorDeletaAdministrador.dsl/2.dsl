system "Bazooca", {

    usecase "Administrador Deleta Administrador", {

        version "1.0", type:"Create", user:"SPLab", date:"03/02/2017"

        actor Administrador, "Usuario Administrador"
        actor system, "Bazooca"

        preCondition "Usuario Administrador esta logado no sistema."

        basicFlow {
            step 1,  Administrador,  "abre tela inicial do sistema"
            step 2,  system,         "exibe tela inicial do sistema"
            step 3,  Administrador,  "clica na opcao 'Administrador' no menu da tela principal"
            step 4,  system,         "apresenta uma listagem dos Administradores cadastrados no sistema"
            step 5,  Administrador,  "clica em algum dos Administradores listados", af:[1]
            step 6,  system,         "abre a tela de edicao de Administrador"
            step 7,  Administrador,  "clica no botao de 'Excluir'", af:[2]
            step 8,  system,         "exibe popup pedindo Confirmacao de delecao"
            step 9,  Administrador,  "confirma delecao", af:[3]
            step 10, system,         "notifica que o Administrador foi adicionado com sucesso", ef:[1,2,3,4]
        }

        alternative 1, "Volta para tela inicial de sistema", {
            step 1, Administrador, "clica no botao Voltar", bfs:2
        }

        alternative 2, "Cancela delecao de Administrador", {
            step 1, Administrador, "clica no botao Cancelar", bfs:4
        }

        alternative 3, "Fecha popup de confirmacao de delecao", {
            step 1, Administrador, "clica no botao 'Cancelar' do popup", bfs:6
        }

        exception 1, "Dados obrigatorios'", { 
            step 1, system,         "informa que os dados obrigatorios devem ser preenchidos"
            step 2, Administrador,  "preenche os dados orbigatorios e clica no botao 'Registrar'", bfs:8
        } 

        exception 2, "Email invalido", {
            step 1, system,         "alerta usuario de que Email e invalido"
            step 2, Administrador,  "insere um Email valido e clica no botao 'Registrar'", bfs:8
        }

        exception 3, "Senha e Confirmacao diferentes", {
            step 1, system,         "alerta usuario de que senhas estao diferentes"
            step 2, Administrador,  "insere Senhas iguais e clica no botao 'Registrar'", bfs:8
        }

        exception 4, "Sem Permissao", {
            step 1, system,         "alerta usuario que Administrador nao esta com nenhuma Permissao"
            step 2, Administrador,  "insere uma permissao e clica no botao 'Registrar'", bfs:8
        }

        postCondition "O Administrador foi adicionado com sucesso."
    }
}
