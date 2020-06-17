system "Bazooca", {

	usecase "Operador De Ecommerce Imprime Pdf Da Danfe", {

		version "1.0", type:"Criacao", user:"SPLab", date:"08/02/2017"

		actor OpEcommerce, "Usuario Operador de Ecommerce"
		actor system, "Bazooca"

		preCondition "Usuario Operador de Ecommerce esta logado no sistema. Existe um Ecommerce com picking para o dia"

		basicFlow {
			step 1,  OpEcommerce, 	"entra na tela inicial do sistema"
			step 2,  system, 		"exibe tela inicial do sistema"
			step 3,  OpEcommerce, 	"clica na opcao 'Picking' no menu da tela principal"
			step 4,  system, 		"exibe tela com o Picking diario para o Ecommerce do Operador"
			step 5,  OpEcommerce, 	"clica no botao 'Iniciar Picking'", af:[1,3]
			step 6,  system, 		"exibe tela com detalhes de Picking"
			step 7,  OpEcommerce, 	"clica em uma das Notas do Picking"
			step 8,  system,		"exibe detalhes da Nota"
			step 9,  OpEcommerce, 	"clica em botao 'Imprimir Danfe'"
			step 10, system,		"exibe pdf com Danfe de Nota"
			step 11, OpEcommerce,   "clica em botao 'Imprimir'", af:[2]
			step 12,  system, 		"envia documento para impressora e exibe tela de Picking"
		}

		alternative 1, "volta para tela inicial do sistema", { 
			step 1, OpEcommerce, "clica no botao 'Voltar'", bfs:2
		} 

		alternative 2, "cancela impressao", {
			step 1, OpEcommerce, "clica no botao 'Cancelar'", bfs:6
		}

		alternative 3, "realiza picking depois de consultar veiculos", {
			step 1, OpEcommerce, "clica em botao 'Consultar Veiculos'"
			step 2, system, "exibe lista de veiculos para picking"
			step 3, OpEcommerce, "clica em botao 'Iniciar Picking'", bfs:6
		}

		postCondition " "

	}
}

