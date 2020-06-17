system "Bazooca", {
 
	usecase "Operador De Terminal Modifica Status De Nota Em Terminal", {

		version "1.0", type:"Criacao", user:"SPLab", date:"08/02/2017"

		actor OpTerminal, "Usuario Operador de Terminal"
		actor system, "Bazooca"

		preCondition "Usuario Operador de Terminal esta logado no sistema. Existe um Terminal com Notas registradas."

		basicFlow {
			step 1,   OpTerminal, 		"entra na tela inicial do sistema"
			step 2,   system, 			"exibe tela inicial do sistema"
			step 3,   OpTerminal, 		"clica na opcao 'Dashboard de Terminal' no menu da tela principal"
			step 4,   system, 			"exibe tela com o Dashboard do Terminal do Operador"
			step 5,   OpTerminal, 		"clica no contador de 'Notas para Entrada'", af:[3]
			step 6,   system, 			"abre uma tela com a lista de 'Pedidos' ou 'Notas'"
			step 7,   OpTerminal, 	"seleciona alguma 'Nota' da lista", af:[1]
			step 8,   system, 			"exibe os dados da 'Nota'"
			step 9,   OpTerminal, 	"clica no botao de 'Alterar Status'"
			step 10,  system, 			"abre drop list para selecao de novo Status"
			step 11,  OpTerminal,  	"seleciona novo Status e clica em 'Alterar'", af:[2]
			step 12,  system, 			"notifica que Status da Nota foi alterado com sucesso"
		}

		alternative 1, "volta para tela inicial do sistema", { 
			step 1, OpTerminal, "clica no botao 'Voltar'", bfs:2
		} 

		alternative 2, "cancela modificacao de status", {
			step 1, OpTerminal, "clica no botao 'Cancelar'", bfs:6
		}

		alternative 3, "seleciona notas de saida", {
			step 1, OpTerminal, "clica em botao 'Notas para Saida'", bfs:6
		}

		postCondition "Nota esta com Status modificado no banco de dados"

	}
}

