system "Bazooca", {

	usecase "Operador De Terminal Deleta Beneficio De Terminal", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor OpTerminal, "Operador do Terminal"
		actor system, "Bazooca"

		preCondition "O Operador logado; Operador pertence ao Terminal alvo. Terminal alvo tem pelo menos um Beneficio registrado."

		basicFlow {
			step 1,  OpTerminal, 	"abre tela inicial do sistema"
			step 2,  system, 		"exibe tela inicial do sistema"
			step 3,  OpTerminal, 	"seleciona a opção 'Meu Terminal' no menu da tela principal" 
			step 4,  system, 		"mostra a tela de Detalhes do Terminal"
			step 5,  OpTerminal, 	"clica em botao 'Excluir' de Beneficio a ser excluido", af:[2]
			step 6,  system,        "exibe popup pedindo Confirmacao de delecao"
            step 7,  OpTerminal, "confirma delecao", af:[1]
			step 8,  system, 		"notifica que o Beneficio de Terminal foi excluido com sucesso"
		}

		alternative 1, "cancela delecao de Beneficio de Terminal", {
			step 1, OpTerminal, "clica em botao 'Cancelar' de popup", bfs:4
		}

		alternative 2, "Volta para tela inicial de sistema", {
            step 1, OpTerminal, "clica no botao Voltar", bfs:2
        }
		
		postCondition "Beneficio de Terminal foi excluido com sucesso." 
	}
}
