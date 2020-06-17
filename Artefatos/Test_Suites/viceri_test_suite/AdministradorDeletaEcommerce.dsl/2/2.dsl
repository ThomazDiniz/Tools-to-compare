system "Bazooca", {

    usecase "Administrador Deleta Ecommerce", {

        version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

        actor Administrador, "Usuario Administrador"
        actor system, "Bazooca"

        preCondition "Usuario Administrador esta logado no sistem; Existe pelo menos um Ecommerce registrado."

        basicFlow {
            step 1, Administrador,   "Entra na tela de Listagem de Ecommerce"
            step 2, system,          "lista o conjunto de ecommerce cadastrados no sistema"
            step 3, Administrador,   "clica em um dos ecommerce listados", af:[1,2]
            step 4, system,          "apresenta tela de edicao de Ecommerce"
            step 5, Administrador,   "clica em botao de 'Remover' na tela de edicao"
            step 6, system,          "exibe popup de confirmacao"
            step 7, Administrador,   "confirma delecao de Ecommerce", af:[3]
            step 8, system,          "noficica usuario de que Ecommerce foi deletado com sucesso."
        }

        alternative 1, "Navega pelas paginas da lista", {
            step 1, Administrador, "navega nas paginas da lista", bfs:2
        }

        alternative 2, "Usuario ordena lista de ecommerce", {
            step 1, Administrador, "ordena os ecommerce por seus atributos", bfs:2
        }

        alternative 3, "Cancela delecao do Ecommerce", {
            step 1, Administrador, "clica no botao 'Cancelar' do popup", bfs:4
        }

        postCondition "Ecommerce deletado do banco de dados."
    }
}
