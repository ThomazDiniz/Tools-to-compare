system "Bazooca", {

	usecase "Administrador Imprime Lista De Produtos De Picking", {

		version "1.0", type:"Criacao", user:"SPLab", date:"08/02/2017"

		actor Administrador, "Usuario Administrador"
		actor system, "Bazooca"

		preCondition "Usuario Administrador esta logado no sistema. Existe um Ecommerce com picking para o dia"

		basicFlow {
			step 1, Administrador, 	"clica na opcao 'Picking' no menu da tela principal"
			step 2, system, 		"exibe lista de Ecommerces registrados no sistema"
			step 3, Administrador, 	"clica em algum dos Ecommerces listados", af:[1,2,3,4]
			step 4, system, 		"exibe tela com o Picking diario para aquele Ecommerce selecionado"
			step 5, Administrador, 	"clica no botao 'Imprimir Lista'", af:[5]
			step 6, system, 		"exibe pdf com lista de Produtos do Picking"
			step 7, Administrador, 	"clica no botao de 'Imprimir'", af:[6]
			step 8, system, 		"envia documento para impressora e exibe tela de Picking"
		}

		alternative 1, "Navega pelas paginas da lista", { 
			step 1, Administrador, "seleciona outra pagina", bfs:2
		}

		alternative 2, "Clica no botao 'Voltar'", { 
			step 1, Administrador, "clica no botao 'Voltar'", bfs:2
		} 

		alternative 3, "Ordena os Ecommerces", { 
			step 1, Administrador, "ordena os Ecommerces por alguma coluna", bfs:2
		}

		alternative 4, "Filtra coletas da lista", {
			step 1, Administrador, "filtra as coletas por algum campo", bfs:2
		}

		alternative 5, "Volta para lista de Ecommerces", { 
			step 1, Administrador, "clica no botao 'Voltar'", bfs:2
		}

		alternative 6, "Cancela impressao de documento", {
			step 1, Administrador, "clica em botao cancelar", bfs:4
		}

		postCondition " "

	}
}

