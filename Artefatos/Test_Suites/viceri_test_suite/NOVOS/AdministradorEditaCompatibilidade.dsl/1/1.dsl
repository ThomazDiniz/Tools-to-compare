system "Bazooca", {

	usecase "Administrador Edita Compatibilidade", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor Administrador, "Usuario Administrador"
		actor system, "Bazooca"
		
		preCondition "Administrador logado; Existe Compatibilidade registrada no sistema."
		
		basicFlow {
			step 1, Administrador, "Clicar na opcao 'Compatibildiade' no menu da tela principal"
			step 2, system, "exibe a tela de listagem das Compatibilidades"
			step 3, Administrador, "clica em uma Compatibilidade existente'", af:[1,2,3,5]
			step 4, system, "exibe a tela de edicao de Compatibilidade"
			step 5, Administrador, "preenche os dados da Compatibilidade e clica em botao 'Atualizar'", af:[4]
			step 6, system, "notifica usuario que os nova Compatibilidade foi atualizado com sucesso", ef:[1,2,3]
		}
		
		alternative 1, "Ordena lista de Compatibilidades",  {
			step 1, Administrador, "clica em um dos botões de ordenacao associada a uma coluna da tabela", bfs:2
		}

		alternative 2, "Filtra lista de Compatibilidades", {
			step 1, Administrador, "preenche campos de filtragem", bfs:2
		}

		alternative 3, "Navega por paginas de tabela", {
			step 1, Administrador, "clica em botao de navegacao de paginas de tabela", bfs:2
		}

		alternative 4, "Cancela atualizacao de Compatibilidade", {
			step 1, Administrador, "clica no botao Cancelar", bfs:2
		}

		alternative 5, "Volta para tela inicial de sistema", {
            step 1, Administrador, "clica no botao Voltar", bfs:2
        }

		exception 1, "Nao insere algum dado obrigatorio'", { 
			step 1, system, "informa que os dados obrigatorios devem ser preenchidos"
			step 2, Administrador, "preenche dados obrigatorios e clica em Atualizar", bfs:6
		}

		exception 2, "Usuario insere Tipo de Mercadoria invalido", {
			step 1, system, "alerta que Horario de Inicio é invalido"
			step 2, Administrador, "preenche um Tipo de Mercadoria valida e clica em Atualizar", bfs:6
		}

		exception 3, "Usuario insere NCM invalido", {
			step 1, system, "alerta que NCM é invalido"
			step 2, Administrador, "preenche um NCM valido e clica em Atualizar", bfs:6
		}
		
		postCondition "A nova Compatibilidade esta atualizada no banco."
	}
}
