system "Bazooca", {

	usecase "Operador De Ecommerce Realiza Picking De Ecommerce", {

		version "1.0", type:"Criacao", user:"SPLab", date:"08/02/2017"

		actor OpEcommerce, "Usuario Operador de Ecommerce"
		actor system, "Bazooca"

		preCondition "Usuario Operador de Ecommerce esta logado no sistema. Existe um Ecommerce com picking para o dia"

		basicFlow {
			step 1, OpEcommerce, 	"entra na tela inicial do sistema"
			step 2, system, 		"exibe tela inicial do sistema"
			step 3, OpEcommerce, 	"clica na opcao 'Picking' no menu da tela principal"
			step 4, system, 		"exibe tela com o Picking diario para o Ecommerce do Operador"
			step 5, OpEcommerce, 	"clica no botao 'Iniciar Picking'", af:[1,3]
			step 6, system, 		"exibe os dados do Picking"
			step 7, OpEcommerce, 	"clica no botao de 'Finalizar Picking'", af:[2]
			step 8, system, 		"notifica que Picking foi finalizado com sucesso e exibe tela inicial de sistema"
		}

		alternative 1, "Clica no botao 'Voltar'", { 
			step 1, OpEcommerce, "clica no botao 'Voltar'", bfs:2
		} 

		alternative 2, "Clica no botao 'Proximo Picking'", {
			step 1, OpEcommerce, "clica no botao 'Proximo Picking'", bfs:6
		}

		alternative 3, "realiza picking depois de consultar veiculos", {
			step 1, OpEcommerce, "clica em botao 'Consultar Veiculos'"
			step 2, system, "exibe lista de veiculos para picking"
			step 3, OpEcommerce, "clica em botao 'Iniciar Picking'", bfs:6
		}

		postCondition "O Picking diario foi realizado para o Ecommerce"

	}
}

