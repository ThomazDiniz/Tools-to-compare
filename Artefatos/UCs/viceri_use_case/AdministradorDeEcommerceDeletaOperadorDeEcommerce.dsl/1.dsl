system "Bazooca", {

    usecase "Administrador De Ecommerce Deleta Operador De Ecommerce", {

        version "1.0", type:"Create", user:"SPLab", date:"03/02/2017"

        actor AdminEcommerce, "Usuario Administrador de Ecommerce"
        actor system, "Bazooca"

        preCondition "Usuario esta logado no sistema. Existe pelo menos um usuario Operador no Ecommerce alvo"

        basicFlow {
            step 1,  AdminEcommerce,  "abre tela inicial do sistema"
            step 2,  system,          "exibe tela inicial do sistema"
            step 3,  AdminEcommerce,  "clica na opcao 'Meu Ecommerce' no menu da tela principal", af:[1]
            step 4,  system,          "exibe tela com Detalhes de Ecommerce"
            step 5,  AdminEcommerce,  "clica em botao 'Excluir' de algum dos Operadores de Ecommerce listados", af:[2]
            step 6,  system,          "exibe popup pedindo Confirmacao de delecao"
            step 7,  AdminEcommerce,  "confirma delecao", af:[3]
            step 8,  system,          "notifica que o Operador de Ecommerce foi excluido com sucesso"
        }

        alternative 1, "Volta para tela inicial de sistema", {
            step 1, AdminEcommerce, "clica no botao Voltar", bfs:2
        }

        alternative 2, "Cancela delecao de Operador de Ecommerce", {
            step 1, AdminEcommerce, "clica no botao 'Cancelar'", bfs:4
        }

        alternative 3, "Fecha popup de confirmacao de delecao", {
            step 1, AdminEcommerce, "clica no botao 'Cancelar' do popup", bfs:4
        }        

        postCondition "O Operador de Ecommerce foi excluido com sucesso."
    }
}
