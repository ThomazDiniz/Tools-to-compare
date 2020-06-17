system "Bazooca", {

	usecase "Administrador Resolve Ocorrencia De Nota", {

		version "1.0", type:"Criacao", user:"SPLab", date:"08/02/2017"

		actor Administrador, "Usuario Administrador"
		actor system, "Bazooca"

		preCondition "Usuario Administrador esta logado no sistema. Existe pelo meno uma nota com ocorrencia registrada."

		basicFlow {
			step 1, Administrador, 	"clica na opcao 'Central de Operacoes' no menu da tela principal"
			step 2, system, 		"exibe Dashboard do sistema"
			step 3, Administrador, 	"clica em contador de 'Notas Pendentes' no card de 'Ocorrencias'", af:[1,3,4,5]
			step 4, system, 		"abre uma tela com a lista de 'Notas'"
			step 5, Administrador, 	"seleciona alguma Nota da lista", af:[2]
			step 6, system, 		"exibe os dados da Nota"
			step 7, Administrador, 	"clica no botao de 'Resolver'", af:[6]
			step 8, system, 		"abre modal para detalhamento de 'Contato'"
			step 9, Administrador,  "digita detalhamento de Contato e clica em 'Confirmar'", af:[4]
			step 10, system, 		"notifica que Ocorrencia foi resolvida com sucesso"
		}

		alternative 1, "Navega pelas paginas da lista", { 
			step 1, Administrador, "seleciona outra pagina", bfs:4
		}

		alternative 2, "Clica no botao Voltar", { 
			step 1, Administrador, "clica no botao 'Voltar'", bfs:2
		} 

		alternative 3, "Ordena Notas", { 
			step 1, Administrador, "ordenas as coletas por alguma coluna", bfs:4
		}

		alternative 4, "Cancela resolucao de ocorrencia", {
			step 1, Administrador, "clica em botao 'Cancelar'", bfs:6
		}

		alternative 5, "Filtra notas da lista", {
			step 1, Administrador, "filtra as notas por algum campo", bfs:4
		}

		alternative 6, "Volta para lista de notas", {
			step 1, Administrador, "clica em botao 'Voltar'", bfs:4
		}

		postCondition "A ocorrencia esta resolvida e nota possui estado de ocorrencia resolvida"

	}
}

