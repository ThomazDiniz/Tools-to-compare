system "Bazooca", {

	usecase "Administrador Realiza Picking De Ecommerce", {

		version "1.0", type:"Criacao", user:"SPLab", date:"08/02/2017"

		actor Administrador, "Usuario Administrador"
		actor system, "Bazooca"

		preCondition "Usuario Administrador esta logado no sistema."

		basicFlow {
			step 1, Administrador, 	"clica na opcao 'Picking' no menu da tela principal"
			step 2, system, 		"exibe lista de Ecommerces registrados no sistema"
			step 3, Administrador, 	"clica em algum dos Ecommerces listados", af:[1,2,3,4]
			step 4, system, 		"abre uma tela com o Picking diario para aquele Ecommerce selecionado"
			step 5, Administrador, 	"clica no botao 'Iniciar Picking'", af:[5,6,8]
			step 6, system, 		"exibe os dados do Picking"
			step 7, Administrador, 	"clica no botao de 'Finalizar Picking'", af:[7]
			step 8, system, 		"notifica que Picking foi finalizado com sucesso e exibe Dashboard de sistema"
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

		alternative 5, "Cancela realizacao de Picking", {
			step 1, Administrador, "clica em botao 'Cancelar'", bfs:2
		}

		alternative 6, "Volta para lista de Ecommerces", { 
			step 1, Administrador, "clica no botao 'Voltar'", bfs:2
		}

		alternative 7, "Clica no botao 'Proximo Picking'", {
			step 1, Administrador, "clica no botao 'Proximo Picking'", bfs:6
		}

		alternative 8, "realiza picking depois de consultar veiculos", {
			step 1, Administrador, "clica em botao 'Consultar Veiculos'"
			step 2, system, "exibe lista de veiculos para picking"
			step 3, Administrador, "clica em botao 'Iniciar Picking'", bfs:6
		}

		postCondition "O Picking diario foi realizado para o Ecommerce"

	}
}

