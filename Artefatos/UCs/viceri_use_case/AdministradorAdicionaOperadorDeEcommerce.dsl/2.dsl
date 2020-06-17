system "Bazooca", {

	usecase "Administrador Adiciona Operador De Ecommerce", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor Administrador, "Usuario Administrador"
		actor system, "Bazooca"

		preCondition "Usuario Administrador esta logado no sistema; Existe pelo menos um Ecommerce registrado."

		basicFlow {
			step 1, Administrador, 	"clica no opcao 'E-commerces' no menu principal"
			step 2, system, 		"exibe a tela com a lista de E-commerces cadastrados no sistema"
			step 3, Administrador, 	"clica em um dos E-commerces listados", af:[1,2]
			step 4, system, 		"exibe tela com informacões de E-commerce"
			step 5, Administrador, 	"adiciona os dados do novo Operador na secao 'Operadores' e clica no botao 'Adicionar Operador'", af:[3]
			step 6, system, 		"mostra operador adicionado em tabela na tela de cadastro", ef:[1,2,3,4,5,6]
		}

		alternative 1, "Navega pelas paginas da lista", { 
			step 1, Administrador, "procura o E-commerce navegando pelas paginas da lista", bfs:2
		}

		alternative 2, "Volta para listagem de Ecommerce", {
			step 1, Administrador, "clica no botao Voltar", bfs:2
		}

		alternative 3, "Cancela registro de novo operador de Ecommerce", {
			step 1, Administrador, "clica no botao Cancelar de registro de operador", bfs:4
		}

		exception 1, "Campos obrigatorios", {
			step 1, system, 		"alerta ao usuario que o campo deve ser preenchido" 
			step 2, Administrador, 	"informa os campos obrigatorios e clica no botao de 'Adicionar Operador'", bfs:6
		}
		alternative 3, "Clica no botao voltar", {
			step 1, Administrador, "clica no botao voltar"
			step 2, system, "exibe tela de Dashboard"
			step 3, Administrador, "", bfs:6
		}

		exception 2, "Nome de Usuario ja cadastrado", { 
			step 1, system, "alerta que ja existe um Operador cadastrado com o nome de usuario informado"
			step 2, Administrador, 	"informa um novo Nome de Usuario e clica no botao de 'Adicionar Operador'", bfs:6
		}

		exception 3, "Email ja cadastrado", { 
			step 1, system, "alerta que ja existe um Operador cadastrado com o email informado"
			step 2, Administrador, 	"informa um novo Email e clica no botao de 'Adicionar Operador'", bfs:6
		}

		exception 4, "Email invalido", { 
			step 1, system, "alerta que ja existe um Operador cadastrado com o email informado"
			step 2, Administrador, 	"informa um novo Email valido e clica no botao de 'Adicionar Operador'", bfs:6
		}

		exception 5, "Cpf ja cadastrado", { 
			step 1, system, "alerta que ja existe um Operador cadastrado com o cpf informado"
			step 2, Administrador, 	"informa um novo Cpf e clica no botao de 'Adicionar Operador'", bfs:6					
		}

		exception 6, "Senhas nao coincidem", { 
			step 1, system, "alerta que as senhas informadas nao coincidem", bfs:4
			step 2, Administrador, 	"informa senhas iguais e clica no botao de 'Adicionar Operador'", bfs:6			
		}

		postCondition "O novo Operador de Ecommerce esta salvo no sistema."
	}
}

