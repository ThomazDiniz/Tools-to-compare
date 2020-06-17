system "Bazooca", {

    usecase "Administrador Deleta Compatibilidade", {

	version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

    actor Administrador, "Usuario Administrador"
    actor system, "Bazooca"

    preCondition "Usuario Administrador deve estar logado no sistema."

    basicFlow {
        step 1, Administrador,  "Clicar na opcao 'Compatibildiade' no menu da tela principal"
        step 2, system,         "exibe a tela de listagem das Compatibilidades"
        step 3, Administrador,  "clica em Compatibilidade listada", af:[1,2]
        step 4, system,         "exibe a tela de edicao de Compatibilidade"
        step 5, Administrador,  "clica em botao 'Deletar'"
        step 6, system,         "abre popup de confirmacao de delecao"
        step 7, Administrador,  "confirma que deseja deletar clicando em 'Sim'", af:[3]
        step 8, system,         "notifica usuario que os nova Compatibilidade foi deletada com sucesso"
    }

    alternative 1, "Navega pelas paginas da lista", {
        step 1, Administrador, "navega nas paginas da lista", bfs:2
    }

    alternative 2, "Usuario ordena lista de Compatibilidades", {
        step 1, Administrador, "ordenas as Compatibilidades por seus atributos", bfs:2
    }

    alternative 3, "Cancela delecao", { 
        step 1, Administrador, "clica no botao 'Cancelar' de popup", bfs:4
    }

    postCondition "Compatibilidade foi deletada."

    }
}

