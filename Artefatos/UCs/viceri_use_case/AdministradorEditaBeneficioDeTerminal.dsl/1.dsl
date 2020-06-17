system "Bazooca", {

    usecase "Administrador Edita Beneficio De Terminal", {

        version "1.0", type:"Update", user:"SPLab", date:"03/02/2017"

        actor Administrador, "Usuario Administrador"
        actor system, "Bazooca"

        preCondition "Usuario Administrador esta logado no sistema. Existe um terminal com beneficio registrado."

        basicFlow {
            step 1, Administrador,  "Entra na tela de Listagem de Terminais"
            step 2, system,         "exibe uma lista com os Terminais cadastrados"
            step 3, Administrador,  "clica em um dos terminais listados", af:[1,4,5]
            step 4, system,         "exibe tela de edicao de Terminal"
            step 5, Administrador,  "altera dados do Beneficio de Terminal e clica no botao de 'Salvar'", af:[2,3]
            step 6, system,         "notifica usuario de que Beneficio de Terminal foi atualizado com sucesso", ef:[1,2]
        }

        alternative 1, "Ordena lista de Terminais", {
            step 1, Administrador, "ordena lista dos Terminais por alguma coluna", bfs:2
        }  

        alternative 2, "Adiciona Beneficio associado a Terminal", {
            step 1, Administrador,  "preenche os dados do novo beneficio e clica no botao 'Adicionar Benficio'"
            step 2, system,         "incrementa o a lista de beneficio do Terminal"
            step 3, Administrador,  "clica em Atualizar", bfs:6
        }

        alternative 3, "Cancela edicao", {
            step 1, Administrador, "clica no botao de 'Cancelar'", bfs:2
        }

        alternative 4, "Navega por paginas de tabela", {
            step 1, Administrador, "clica em botao de navegacao de paginas de tabela", bfs:2
        }

        alternative 5, "Filtra lista de Terminais", {
            step 1, Administrador, "preenche campos de filtragem", bfs:2
        }

        exception 1, "Usuario nao preenche algum campo obrigatorio", {
            step 1, system,         "informa que o campo e obrigatorio"
            step 2, Administrador,  "preenche o campo obrigatorio e clica no botao de 'Atualizar'", bfs:6
        }

        exception 2, "insere beneficio de tipo ja existente", {
            step 1, system,         "informa que beneficio ja esta cadastrado"
            step 2, Administrador,  "modifica tipo de beneficio e clica em 'Salvar'", bfs:6
        }

        postCondition "O Beneficio de Terminal foi atualizado com sucesso."
    }
}
