system "Bazooca", {

	usecase "Administrador Edita Parametros do NFe Reader", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor Administrador, "Usuario Administrador"
		actor system, "Bazooca"

		preCondition "Administrador logado."

		basicFlow {
			step 1, Administrador,  	"abre tela inicial do sistema"
			step 2, system,         	"exibe tela inicial do sistema"
			step 3, Administrador, 		"entra na tela de Edição de Parametros do NFe Reader"
			step 4, system, 			"apresenta uma tela com os Parametros do NFe Reader com os valores atuais"
			step 5, Administrador, 		"escolhe dia de Parametros do NFe Reader", af:[1]
			step 6, system, 			"insere automaticamente Horario de Inicio, Horario de Termino, Periodicidade e Raio atuais"
			step 7, Administrador, 		"modifica valores de paremetros e clica em Atualizar"
			step 8, system, 			"notifica usuario que os Parâmetros foram atualizados com sucesso", ef:[1,2]
		}

		alternative 1, "cancela edicao de Parametros", {
			step 1, system, "clica no botao de 'Cancelar'", bfs:2
		}

		exception 1, "Não insere algum dado obrigatorio'", { 
			step 1, system, "informa que os dados obrigatorios devem ser preenchidos"
			step 2, Administrador, "preenche dados obrigatorios e clica em Atualizar", bfs:6
		}

		exception 2, "Usuario insere algum dado invalido", {
			step 1, system, "alerta que dado e invalido"
			step 2, Administrador, "preenche dados obrigatorios e clica em Atualizar", bfs:6
		}

		postCondition "Os Parametros do NFe Reader devem estar atualizados."
	}
}
