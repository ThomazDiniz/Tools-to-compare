system "Bazooca", {
 ?????????????????????????????????????????????
	usecase "Operador De Terminal Modifica Status De Nota Em Terminal", {

		version "1.0", type:"Criacao", user:"SPLab", date:"08/02/2017"

		actor OpTerminal, "Usuario Operador de Terminal"
		actor system, "Bazooca"

		preCondition "Usuario Operador de Terminal esta logado no sistema. Existe um Terminal com Notas registradas."

		basicFlow {
			step 1,  OpTerminal, 	"entra na tela inicial do sistema"
			step 2,  system, 		"exibe tela inicial do sistema"
			step 3,  OpTerminal, 	"clica na opcao 'Picking' no menu da tela principal"
			step 4,  system, 		"exibe tela com o Picking diario para o Ecommerce do Operador"
			step 5,  OpTerminal, 	"clica no botao 'Iniciar Picking'", af:[1,3]
			step 6,  system, 		"exibe tela com detalhes de Picking"
			step 7,  OpTerminal, 	"clica em uma das Notas do Picking"
			step 8,  system,		"exibe detalhes da Nota"
			step 9,  OpTerminal, 	"clica em botao 'Alterar Status'"
			step 10, system,		"exibe pdf com Danfe de Nota"
			step 11, OpTerminal,    "clica em botao 'Imprimir'", af:[2]
			step 12,  system, 		"envia documento para impressora e exibe tela de Picking"
		}

		alternative 1, "volta para tela inicial do sistema", { 
			step 1, OpTerminal, "clica no botao 'Voltar'", bfs:2
		} 

		alternative 2, "cancela impressao", {
			step 1, OpTerminal, "clica no botao 'Cancelar'", bfs:6
		}

		alternative 3, "realiza picking depois de consultar veiculos", {
			step 1, OpTerminal, "clica em botao 'Consultar Veiculos'"
			step 2, system, "exibe lista de veiculos para picking"
			step 3, OpTerminal, "clica em botao 'Iniciar Picking'", bfs:6
		}

		postCondition " "

	}
}

