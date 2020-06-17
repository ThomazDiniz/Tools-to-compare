system "Bazooca", {

	usecase "Administrador Registra Ocorrencia Em Nota", {

		version "1.0", type:"Criacao", user:"SPLab", date:"08/02/2017"

		actor Administrador, "Usuario Administrador"
		actor system, "Bazooca"

		preCondition "Usuario Administrador esta logado no sistema."

		basicFlow {
			step 1, Administrador, 	"clica na opcao 'Central de Operacoes' no menu da tela principal"
			step 2, system, 		"exibe Dashboard do sistema"
			step 3, Administrador, 	"clica em contador 'Outros'", af:[1,2,3,4,5,12]
			step 4, system, 		"abre uma tela com a lista de 'Pedidos' ou Notas"
			step 5, Administrador, 	"seleciona algum Pedido ou Nota da lista", af:[6,7,8,10]
			step 6, system, 		"exibe os dados da Nota"
			step 7, Administrador, 	"clica no botao de 'Registrar Ocorrencia'", af:[11]
			step 8, system, 		"abre modal para digitacao da Ocorrencia"
			step 9, Administrador,  "digita Ocorrencia e clica em 'Confirmar'", af:[9]
			step 10, system, 		"notifica que Ocorrencia foi registrada com sucesso"
		}

		alternative 1, "Seleciona contador de 'Engine'", { 
			step 1, Administrador, "clica em algum contador de 'Engine' na secao de 'Notas'", bfs:4
		}

		alternative 2, "Seleciona contador de 'Conferencia'", { 
			step 1, Administrador, "clica em algum contador de 'Aceitas' na secao de 'Notas'", bfs:4
		} 

		alternative 3, "Seleciona contador de 'Picking'", { 
			step 1, Administrador, "clica em algum contador de 'Picking' na secao de 'Notas'", bfs:4
		} 

		alternative 4, "Seleciona contador de 'Atrasos'", { 
			step 1, Administrador, "clica em algum contador de 'Atrasos' na secao de 'Notas'", bfs:4
		} 

		alternative 5, "Seleciona contador de 'Retornos'", { 
			step 1, Administrador, "clica em algum contador de 'Retornos' na secao de 'Notas'", bfs:4
		} 

		alternative 6, "Navega pelas paginas da lista", { 
			step 1, Administrador, "seleciona outra pagina", bfs:4
		}

		alternative 7, "Clica no botao Voltar", { 
			step 1, Administrador, "clica no botao 'Voltar'", bfs:2
		} 

		alternative 8, "Ordena Notas", { 
			step 1, Administrador, "ordenas as coletas por alguma coluna", bfs:4
		}

		alternative 9, "Cancela registro de ocorrencia", {
			step 1, Administrador, "clica em botao 'Cancelar'", bfs:6
		}

		alternative 10, "Filtra notas da lista", {
			step 1, Administrador, "filtra as notas por algum campo", bfs:4
		}

		alternative 11, "Volta para lista de notas", {
			step 1, Administrador, "clica em botão 'Voltar'", bfs:4
		}

		alternative 12, "Seleciona contador de 'Ocorrencias'", {
			step 1, Administrador, "clica em algum contador de 'Ocorrencias' na secao de 'Notas'", bfs:4
		}

		postCondition "A ocorrencia esta registrada"

	}
}

