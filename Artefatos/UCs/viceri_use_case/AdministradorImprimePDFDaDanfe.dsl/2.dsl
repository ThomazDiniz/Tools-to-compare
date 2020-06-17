system "Bazooca", {

	usecase "Administrador Visualiza PDF Da Danfe", {

	version "1.0", type:"Criacao", user:"SPLab", date:"08/02/2017"

	actor Administrador, "Usuario Administrador"
	actor system, "Bazooca"

	preCondition "Usuario Administrador esta logado no sistema."

	basicFlow {
		step 1, Administrador, 	"clica na opcao 'Dashboard' no menu da tela principal"
		step 2, system, 		"exibe de dashboard do sistema"
		step 3, Administrador, 	"clica em algum contador de 'Engine' na secao de 'Notas'", af:[1,2,3,4,5]
		step 4, system, 		"abre uma tela com as listas das 'Notas'"
		step 5, Administrador, 	"seleciona alguma Nota na lista", af:[6,7,8]
		step 6, system, 		"exibe os dados das notas"
		step 7, Administrador, 	"clica no botao de 'Visualizar DANFE'"
		step 8, system, 		"abre uma nova aba com a versao da Danfe em PDF"
	}

	alternative 1, "Seleciona contador de 'Conferência'", { 
		step 1, Administrador, "clica em algum contador de 'Conferência' na secao de 'Notas'", bfs:4
	}

	alternative 2, "Seleciona contador de 'Picking'", { 
		step 1, Administrador, "clica em algum contador de 'Picking' na secao de 'Notas'", bfs:4
	} 

	alternative 3, "Seleciona contador de 'Atrasos'", { 
		step 1, Administrador, "clica em algum contador de 'Atrasos' na secao de 'Notas'", bfs:4
	} 

	alternative 4, "Seleciona contador de 'Retornos'", { 
		step 1, Administrador, "clica em algum contador de 'Retornos' na secao de 'Notas'", bfs:4
	} 

	alternative 5, "Seleciona contador de 'Ocorrências'", { 
		step 1, Administrador, "clica em algum contador de 'Ocorrências' na secao de 'Notas'", bfs:4
	}

	alternative 6, "Navega pelas paginas da lista", { 
		step 1, Administrador, "seleciona outra pagina", bfs:4
	}

	alternative 7, "Clica no botao voltar", { 
		step 1, Administrador, "clica no botao 'Voltar'", bfs:2
	} 

	alternative 8, "Ordena Notas", { 
		step 1, Administrador, "ordenas as notas por alguma coluna", bfs:4
	} 

	postCondition " "

	}
}

