system "Bazooca", {

	usecase "Operador De Terminal Adiciona Operador De Terminal", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor Operador, "Operador do Terminal"
		actor system, "Bazooca"

		preCondition "O Operador logado; Operador pertence ao Terminal alvo."

		basicFlow {
			step 1, Operador, 	"abre tela inicial do sistema"
			step 2, system, 	"exibe tela inicial do sistema"
			step 3, Operador, 	"seleciona a opção 'Meu Terminal' no menu da tela principal" 
			step 4, system, 	"mostra a tela de Detalhes do Terminal"
			step 5, Operador, 	"clica eno botao 'Adicionar Operador'", af:[2]
			step 6, system, 	"exibe form de adicao de dados de Operador"
			step 7, Operador, 	"clica no botao de 'Adicionar' do form de adicao de operador", af:[1]
			step 8, system, 	"notifica que o operador de Terminal foi inserido com sucesso", ef:[1,2]
		}

		alternative 1, "cancela insercao de Operador de Terminal", {
			step 1, Operador, "clica em botao 'Cancelar' de form de dados de Operador", bfs:4
		}

		alternative 2, "volta para tela inicial do sistema", {
			step 1, Operador, "clica no botao 'Voltar'", bfs:2
		}

		exception 1, "insere algum dado invalido", { 
			step 1, system, "alerta que determinado dado esta invalido", bfs:6
		}

		exception 2, "Nao insere algum dado obrigatorio'", { 
			step 1, system, "informa que os dados obrigatorios devem ser preenchidos", bfs:6			
		} 
		
		postCondition "Operador de Terminal com dados atualizados no sistema." 
	}
}
