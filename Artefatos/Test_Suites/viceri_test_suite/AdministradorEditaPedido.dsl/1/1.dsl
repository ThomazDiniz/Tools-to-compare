	system "Bazooca", {

	usecase "Administrador Edita Pedido", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor Administrador, "Usuario Administrador"
		actor system, "Bazooca"

		preCondition "Usuario Administrador logado no sistema; Existem Pedidos registrados no sistema."

		basicFlow {
			step 1, Administrador,  "abre tela inicial do sistema"
			step 2, system,         "exibe tela inicial do sistema"
			step 3, Administrador, 	"clica na opcao 'Pedidos' no menu da tela principal"
			step 4, system, 		"exibe a tela de listagem de Pedidos"
			step 5, Administrador, 	"clica em um Pedido existente", af:[1,2,3,5]
			step 6, system, 		"exibe a tela de edicao de Pedido"
			step 7, Administrador, 	"preenche os dados de novo CEP"
			step 8, system, 		"preenche demais campos de Endereco exceto Numero e Complemento", ef:[1]
			step 9, Administrador, 	"preenche demais campos de Endereco e clica em Atualizar", af:[4]
			step 10, system, 		"notifica usuario que o Pedido foi atualizado com sucesso", ef:[2]
		}

		
		alternative 1, "ordena lista de Pedidos",  {
			step 1, Administrador, "clica em um dos botões de ordenacao associada a uma coluna da tabela", bfs:4
		}

		alternative 2, "filtra lista de Pedidos", {
			step 1, Administrador, "preenche campos de filtragem", bfs:4
		}

		alternative 3, "navega por paginas de tabela", {
			step 1, Administrador, "clica em botao de navegacao de paginas de tabela", bfs:4
		}

		alternative 4, "cancela atualizacao de Pedido", {
			step 1, Administrador, "clica no botao Cancelar", bfs:4
		}

		alternative 5, "volta para tela inicial de sistema", {
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
