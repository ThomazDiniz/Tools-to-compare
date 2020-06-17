system "Bazooca", {

	usecase "Operador De Ecommerce Registra Ocorrencia Em Nota De Picking", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor Operador, "Operador do Ecommerce"
		actor system, "Bazooca"

		preCondition "O Operador logado; Operador pertence Ecommerce alvo."

		basicFlow {
			step 1, Operador, 	"seleciona a opcao 'Picking' no menu da tela principal"
			step 2, system, 	"mostra a tela com Picking para o dia"
			step 3, Operador, 	"clica em botao 'Iniciar Picking'", af:[2]
			step 4, system, 	"mostra tela com dados de Picking"
			step 5, Operador, 	"clica no botao 'Registrar Ocorrencia'" 
			step 6, system, 	"abre a janela de registro da Ocorrencia"
			step 7, Operador, 	"entra com o texto descrevendo sua Ocorrencia e clica no botao 'Registrar'", af:[1]
			step 8, system, 	"cadastra a Ocorrencia e volta para tela de Picking", ef:[1]
		}

		alternative 1, "Clicar no botao 'Cancelar'", { 
			step 1, Operador, "desiste de salvar uma ocorrencia e clica bo botao 'Cancelar'", bfs:4
		}

		alternative 2, "registra ocorrencia apos visualizar lista de veiculos", {
			step 1, Operador, "clica em botao 'Consultar Veiculos'"
			step 2, system, "exibe lista de veiculos para picking"
			step 3, Operador, "clica em botao 'Iniciar Picking'", bfs:4
		}

		exception 1, "Nao insere a descricao da ocorrencia'", { 
			step 1, Operador, 	"nao insere a descricao da ocorrencia e clica no botao de 'Salvar'"
			step 2, system, 	"informa que a mensagem da ocorrencia nao pode ser vazia"
			step 3, Operador, 	"insere descricao valida para Ocorrencia e clica no botao 'Salvar'", bfs:4
		} 
		
		postCondition "O sistema tem uma nova ocorrencia cadastrada para aquela nota." 
	}
}
