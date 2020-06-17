system "Bazooca", {

	usecase "Administrador Edita Pedido", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor Administrador, "Usuario Administrador"
		actor system, "Bazooca"

		preCondition "Usuario Administrador logado no sistema; Existem Pedidos registrados no sistema."

		basicFlow {
			step 1, Administrador, 	"Clicar na opcao 'Pedidos' no menu da tela principal"
			step 2, system, 		"exibe a tela de listagem de Pedidos"
			step 3, Administrador, 	"clica em um Pedido existente", af:[1,2,3]
			step 4, system, 		"exibe a tela de edicao de Pedido"
			step 5, Administrador, 	"preenche os dados de novo CEP"
			step 6, system, 		"preenche demais campos de Endereco exceto Numero e Complemento", ef:[1]
			step 7, Administrador, 	"preenche demais campos de Endereco e clica em Atualizar", af:[4]
			step 8, system, 		"notifica usuario que o Pedido foi atualizado com sucesso", ef:[2]
		}

		
		alternative 1, "Usuario ordena lista de Pedidos",  {
			step 1, Administrador, "clica em um dos botões de ordenacao associada a uma coluna da tabela", bfs:2
		}

		alternative 2, "Usuario filtra lista de Pedidos", {
			step 1, Administrador, "preenche campos de filtragem", bfs:2
		}

		alternative 3, "Usuario navega por paginas de tabela", {
			step 1, Administrador, "clica em botao de navegacao de paginas de tabela", bfs:2
		}

		alternative 4, "Usuario cancela atualizacao de Pedido", {
			step 1, Administrador, "clica no botao Cancelar", bfs:2
		}


		exception 1, "Usuario insere CEP invalido", {
			step 1, system, "alerta que CEP é invalido"
			step 2, Administrador, "preenche um cpf valido e clica em Atualizar", bfs:6
		}

		exception 2, "Nao insere algum dado obrigatorio'", { 
			step 1, system, "informa que os dados obrigatorios devem ser preenchidos"
			step 2, Administrador, "preenche dados obrigatorios e clica em Atualizar", bfs:6
		}

		postCondition "O Pedido esta atualizado no banco."
	}
}
