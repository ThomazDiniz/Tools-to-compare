system "Bazooca", {

	usecase "Operador De Ecommerce Imprime Lista De Produtos Do Picking", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor Operador, "Operador do Ecommerce"
		actor system, "Bazooca"

		preCondition "O Operador logado; Operador pertence Ecommerce alvo."

		basicFlow {
			step 1, Operador, 	"seleciona a opcao 'Picking' no menu da tela principal"
			step 2, system, 	"mostra a tela com Picking para o dia"
			step 3, Operador, 	"clica em botao 'Iniciar Picking'", af:[2]
			step 4, system, 	"mostra tela com dados de Picking"
			step 5, Operador, 	"clica no botao 'Imprimir Lista'" 
			step 6, system, 	"exibe pdf com lista de produtos"
			step 7, Operador, 	"clica em botao 'Imprimir'", af:[1]
			step 8, system, 	"envia documento para impressora e volta para tela de Picking"
		}

		alternative 1, "desiste de imprimir lista de produtos", { 
			step 1, Operador, "clica bo botao 'Cancelar'", bfs:4
		}

		alternative 2, "imprime lista de produtos sem iniciar picking", {
			step 1, Operador, "clica em botao 'Imprimir Lista'", bfs:6
		}

		postCondition " " 
	}
}
