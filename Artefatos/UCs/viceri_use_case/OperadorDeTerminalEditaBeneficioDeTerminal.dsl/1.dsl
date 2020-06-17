system "Bazooca", {

	usecase "Operador De Terminal Edita Beneficio De Terminal", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor OpTerminal, "Operador do Terminal"
		actor system, "Bazooca"

		preCondition "O Operador logado; Operador pertence ao Terminal alvo. Terminal alvo tem pelo menos um Beneficio registrado."

		basicFlow {
			step 1, OpTerminal, 	"abre tela inicial do sistema"
			step 2, system, 		"exibe tela inicial do sistema"
			step 3, OpTerminal, 	"seleciona a opção 'Meu Terminal' no menu da tela principal" 
			step 4, system, 		"mostra a tela de Detalhes do Terminal"
			step 5, OpTerminal, 	"seleciona Beneficio a ser editado"
			step 6, system, 		"exibe form de edicao de dados de Beneficio"
			step 7, OpTerminal, 	"modifica os dados existentes e clica no botao de 'Salvar' do form de Beneficio", af:[1]
			step 8, system, 		"notifica que o Beneficio de Terminal foi atualizado com sucesso", ef:[1,2]
		}

		alternative 1, "cancela atualizacao de dados de Beneficio de Terminal", {
			step 1, OpTerminal, "clica em botao 'Cancelar' de form de dados de Beneficio", bfs:4
		}

		exception 1, "insere algum dado invalido", { 
			step 1, system, "alerta que determinado dado esta invalido", bfs:6
		}

		exception 2, "Nao insere algum dado obrigatorio'", { 
			step 1, system, "informa que os dados obrigatorios devem ser preenchidos", bfs:6			
		} 
		
		postCondition "Beneficio de Terminal com dados atualizados no sistema." 
	}
}
