system "Bazooca", {

  usecase "Administrador Deleta Terminal", {

    version "1.0", type:"Delete", user:"SPLab", date:"06/02/2017"

    actor Administrador, "Usuario Administrador"
    actor system, "Bazooca"

    preCondition "Administrador logado; Existe ao menos um Terminal cadastrado."

    basicFlow {
      step 1, Administrador,  "Entra na tela de Listagem de Terminais"
      step 2, system,         "lista o conjunto de termianis cadastrados no sistema"
      step 3, Administrador,  "clica em um dos terminais listados", af:[1,2]
      step 4, system,         "apresenta tela de edicao de Terminal"
      step 5, Administrador,  "clica em botao de 'Remover' na tela de edicao"
      step 6, system,         "exibe popup de confirmacao"
      step 7, Administrador,  "confirma clicando no botao 'Sim'", af:[3]
      step 8, system,         "noficica usuario de que Terminal foi deletado com sucesso."
    }

    alternative 1, "Navega pelas paginas da lista", {
      step 1, Administrador, "navega nas paginas da lista", bfs:2
    }

    alternative 2, "Usuario ordena lista de Terminais", {
      step 1, Administrador, "ordena os terminais por seus atributos", bfs:2
    }

    alternative 3, "Cancela delecao do Terinal", {
      step 1, Administrador, "clica no botao 'Não' do popup", bfs:4
    }

    postCondition "Terminal foi deletado."

  }
}
