system "Bazooca", {

    usecase "Administrador Deleta Beneficio de Terminal", {

        version "1.0", type:"Criacao", user:"SPLab", date:"06/02/2017"

        actor Administrador, "Usuario Administrador"
        actor system, "Bazooca"

        preCondition "Usuario Administrador deve estar logado no sistema"

        basicFlow {
            step 1, Administrador,  "clica no opcao 'Terminais' no menu da tela principal"
            step 2, system,         "exibe a listagens dos Terminais"
            step 3, Administrador,  "clica em um dos terminais listados", af:[1,2]
            step 4, system,         "apresenta tela de edicao de Terminal"
            step 5, Administrador,  "clica no botao de 'Remover' do beneficio a ser removido"
            step 6, system,         "exibe popuo de confirmacao"
            step 7, Administrador,  "clica em botao de 'Sim'", af:[3]
            step 8, system,         "noficica usuario de que Terminal foi deletado com sucesso."
        }

        alternative 1, "Navega pelas paginas da lista", {
            step 1, Administrador, "navega nas paginas da lista", bfs:2
        }

        alternative 2, "Usuario ordena lista de Terminais", {
            step 1, Administrador, "ordenas os terminais por seus atributos", bfs:2
        }
        
        alternative 3, "Cancelar remocao", {
            step 1, Administrador, "clica no botao de 'Voltar'", bfs:4
        }

        postCondition "Beneficio de Terminal deletado no sistema."
    }
}
