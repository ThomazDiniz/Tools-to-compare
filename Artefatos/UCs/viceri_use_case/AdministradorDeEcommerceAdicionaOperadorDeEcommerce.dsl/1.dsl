system "Bazooca", {

	usecase "Administrador De Ecommerce Adiciona Operador De Ecommerce", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor AdminEcommerce, "Usuario Administrador de Ecommerce"
		actor system, "Bazooca"

		preCondition "Usuario Administrador de Ecommerce esta logado no sistema; Usuario pertence ao Ecommerce alvo."

		basicFlow {
			step 1, AdminEcommerce,  	"abre tela inicial do sistema"
            step 2, system,         	"exibe tela inicial do sistema"
			step 3, AdminEcommerce,  	"clica no opcao 'Meu Ecommerce' no menu principal"
			step 4, system, 			"exibe tela com informacoes de Ecommerce"
			step 5, AdminEcommerce,  	"adiciona os dados do novo Operador na secao 'Operadores' e clica no botao 'Adicionar Operador'", af:[1,2]
			step 6, system, 			"notifica que o operador foi adicionado e o mostra em tabela de operadores", ef:[1,2,3,4,5,6]
		}

		alternative 1, "Cancela registro de novo operador de Ecommerce", {
			step 1, AdminEcommerce, "clica no botao 'Cancelar' de registro de operador", bfs:4
		}

		alternative 2, "Volta para tela inicial do sistema", {
            step 1, AdminEcommerce, "clica no botao 'Voltar' do form de Ecommerce", bfs:2
        }

		exception 1, "Campos obrigatorios", {
			step 1, system, 		"alerta ao usuario que o campo deve ser preenchido" 
			step 2, AdminEcommerce, 	"informa os campos obrigatorios e clica no botao de 'Adicionar Operador'", bfs:6
		}

		exception 2, "Nome de Usuario ja cadastrado", { 
			step 1, system, "alerta que ja existe um Operador cadastrado com o nome de usuario informado"
			step 2, AdminEcommerce, 	"informa um novo Nome de Usuario e clica no botao de 'Adicionar Operador'", bfs:6
		}

		exception 3, "Email ja cadastrado", { 
			step 1, system, "alerta que ja existe um Operador cadastrado com o email informado"
			step 2, AdminEcommerce, 	"informa um novo Email e clica no botao de 'Adicionar Operador'", bfs:6
		}

		exception 4, "Email invalido", { 
			step 1, system, "alerta que ja existe um Operador cadastrado com o email informado"
			step 2, AdminEcommerce, 	"informa um novo Email valido e clica no botao de 'Adicionar Operador'", bfs:6
		}

		exception 5, "Cpf ja cadastrado", { 
			step 1, system, "alerta que ja existe um Operador cadastrado com o cpf informado"
			step 2, AdminEcommerce, 	"informa um novo Cpf e clica no botao de 'Adicionar Operador'", bfs:6			
		}

		exception 6, "Senhas nao coincidem", { 
			step 1, system, "alerta que as senhas informadas nao coincidem"
			step 2, AdminEcommerce, 	"informa senhas iguais e clica no botao de 'Adicionar Operador'", bfs:6
		}

		postCondition "O novo Operador de Ecommerce esta salvo no sistema."
	}
}

