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
            step 10, system,         "notifica que o Administrador foi excluido com sucesso"
        }

        alternative 1, "Volta para tela inicial de sistema", {
            step 1, Administrador, "clica no botao Voltar", bfs:2
        }

        alternative 2, "Cancela delecao de Administrador", {
            step 1, Administrador, "clica no botao 'Cancelar'", bfs:4
        }

        alternative 3, "Fecha popup de confirmacao de delecao", {
            step 1, Administrador, "clica no botao 'Cancelar' do popup", bfs:6
        }        

        postCondition "O Administrador foi excluido com sucesso."
    }
}
