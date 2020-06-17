system "Bazooca", {

	usecase "Administrador Registra Ocorrencia Em Nota De Coleta", {

		version "1.0", type:"Criacao", user:"SPLab", date:"08/02/2017"

		actor Administrador, "Usuario Administrador"
		actor system, "Bazooca"

		preCondition "Usuario Administrador esta logado no sistema."

		basicFlow {
			step 1, Administrador, 	"clica na opcao 'Central de Operacoes' no menu da tela principal", af[11]
			step 2, system, 		"exibe Dashboard do sistema"
			step 3, Administrador, 	"clica em contador 'Geradas' na secao de 'Coletas'", af:[1,2,3,4]
			step 4, system, 		"abre uma tela com as listas das 'Coletas'"
			step 5, Administrador, 	"seleciona alguma Coleta da lista", af:[5,6,7,10]
			step 6, system, 		"exibe os dados da Coleta"
			step 7, Administrador, 	"clica no botao de 'Registrar Ocorrencia' associado a qualquer item da nota", af:[9]
			step 8, system, 		"abre modal para digitacao da ocorrencia"
			step 9, Administrador,  "digita ocorrencia e clica em 'Confirmar'", af:[8]
			step 10, system, 		"notifica que Ocorrencia foi registrada com sucesso"
		}

		alternative 1, "Seleciona contador de 'Aguardando Picking'", { 
			step 1, Administrador, "clica em algum contador de 'Aguardando Picking' na secao de 'Coletas'", bfs:4
		}

		alternative 2, "Seleciona contador de 'Aceitas'", { 
			step 1, Administrador, "clica em algum contador de 'Aceitas' na secao de 'Coletas'", bfs:4
		} 

		alternative 3, "Seleciona contador de 'Recusadas'", { 
			step 1, Administrador, "clica em algum contador de 'Recusadas' na secao de 'Coletas'", bfs:4
		} 

		alternative 4, "Seleciona contador de 'A Caminho'", { 
			step 1, Administrador, "clica em algum contador de 'A Caminho' na secao de 'Coletas'", bfs:4
		} 

		alternative 5, "Navega pelas paginas da lista", { 
			step 1, Administrador, "seleciona outra pagina", bfs:4
		}

		alternative 6, "Clica no botao 'Voltar'", { 
			step 1, Administrador, "clica no botao 'Voltar'", bfs:2
		} 

		alternative 7, "Ordena Coletas", { 
			step 1, Administrador, "ordena as Coletas por alguma coluna", bfs:4
		}

		alternative 8, "Cancela registro de ocorrencia", {
			step 1, Administrador, "clica em botao 'Cancelar'", bfs:6
		}

		alternative 9, "Volta para lista de Coletas", { 
			step 1, Administrador, "clica no botao 'Voltar'", bfs:4
		}

		alternative 10, "Filtra coletas da lista", {
			step 1, Administrador, "filtra as coletas por algum campo", bfs:4
		}

		alternative 11, "Clica em tab 'Picking' de menu principal", {
			
		}

		postCondition "A ocorrencia esta registrada e nota esta com status de ocorrencia registrada"

	}
}

