system "Bazooca", {

	usecase "Administrador Imprime Pdf Da Danfe", {

	version "1.0", type:"Criacao", user:"SPLab", date:"08/02/2017"

	actor Administrador, "Usuario Administrador"
	actor system, "Bazooca"

	preCondition "Usuario Administrador esta logado no sistema."

	basicFlow {
		step 1, Administrador,  "abre tela inicial do sistema"
        step 2, system,         "exibe tela inicial do sistema" 
		step 3, Administrador, 	"clica na opcao 'Central de Operacoes' no menu da tela principal"
		step 4, system, 		"exibe dashboard do sistema"
		step 5, Administrador, 	"clica em algum contador de 'Engine' na secao de 'Notas'", af:[1,2,3,4,5]
		step 6, system, 		"abre uma tela com as listas das 'Notas'"
		step 7, Administrador, 	"seleciona alguma Nota na lista", af:[6,7,8]
		step 8, system, 		"exibe os dados da nota selecionada"
		step 9, Administrador, 	"clica no botao de 'Visualizar DANFE'"
		step 10, system, 		"abre uma nova aba com a versao da Danfe em PDF"
		step 11, Administrador, "clica no botao 'Imprimir'", af:[9]
		step 12, system, 		"envia documento para impressora"
	}

	alternative 1, "Seleciona contador de 'Conferencia'", { 
		step 1, Administrador, "clica em algum contador de 'Conferencia' na secao de 'Notas'", bfs:6
	}

	alternative 2, "Seleciona contador de 'Picking'", { 
		step 1, Administrador, "clica em algum contador de 'Picking' na secao de 'Notas'", bfs:6
	} 

	alternative 3, "Seleciona contador de 'Atrasos'", { 
		step 1, Administrador, "clica em algum contador de 'Atrasos' na secao de 'Notas'", bfs:6
	} 

	alternative 4, "Seleciona contador de 'Retornos'", { 
		step 1, Administrador, "clica em algum contador de 'Retornos' na secao de 'Notas'", bfs:6
	} 

	alternative 5, "Seleciona contador de 'Ocorrencias'", { 
		step 1, Administrador, "clica em algum contador de 'Ocorrencias' na secao de 'Notas'", bfs:6
	}

	alternative 6, "Navega pelas paginas da lista", { 
		step 1, Administrador, "seleciona outra pagina", bfs:6
	}

	alternative 7, "Clica no botao voltar", { 
		step 1, Administrador, "clica no botao 'Voltar'", bfs:4
	} 

	alternative 8, "Ordena Notas", { 
		step 1, Administrador, "ordenas as notas por alguma coluna", bfs:6
	} 

	alternative 9, "Cancela impressao de Danfe", {
		step 1, Administrador, "clica em botao 'Cancelar'", bfs:8
	}

	postCondition "A Danfe esta impressa"

	}
}

