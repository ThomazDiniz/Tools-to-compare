system "Bazooca", {

	usecase "Operador De Terminal Edita Terminal", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor Operador, "Operador do Terminal"
		actor system, "Bazooca"

		preCondition "O Operador logado; Operador pertence ao Terminal alvo."

		basicFlow {
			step 1, Operador, 	"abre tela inicial do sistema"
			step 2, system, 	"exibe tela inicial do sistema"
			step 3, Operador, 	"seleciona a opcao 'Meu Terminal' no menu da tela principal" 
			step 4, system, 	"mostra a tela de Detalhes do Terminal"
			step 5, Operador, 	"modifica os dados existentes e clica no botao de 'Atualizar'", af:[1]
			step 6, system, 	"notifica que o Terminal foi atualizado com sucesso", ef:[1,2]
		}

		alternative 1, "cancela atualizacao de Terminal", {
			step 1, Operador, "clica em botao 'Cancelar'", bfs:2
		}

		exception 1, "Cnpj ja existe no sistema", { 
			step 1, system, "alerta que ja existe um Terminal de mesmo Cnpj existente no sistema", bfs:4
		}

		exception 2, "Nao insere algum dado obrigatorio'", { 
			step 1, system, "informa que os dados obrigatorios devem ser preenchidos", bfs:4			
		} 
		
		postCondition "Terminal com dados atualizados no sistema." 
	}
}
