system "Bazooca", {

	usecase "Administrador Edita Parametros do NFe Reader", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor Administrador, "Administrador"
		actor system, "Bazooca"

		preCondition "Administrador logado."

		basicFlow {
			step 1, Administrador, "Entra na tela de Edicao de Parametros do NFe Reader"
			step 2, system, "apresenta uma tela com os Parâmetros do NFe Reader com os valores atuais"
			step 3, Administrador, "escolhe dia de Parametros do NFe Reader"
			step 4, system, "insere automaticamente Horario de Inicio, Horario de Termino, Periodicidade e Raio atuais"
			step 5, Administrador, "modifica valores de parâmetros e clica em Atualizar"
			step 6, system, "notifica usuario que os Parâmetros foram atualizados com sucesso", ef:[1,2]
		}

		exception 1, "Nao insere algum dado obrigatorio'", { 
			step 1, system, "informa que os dados obrigatorios devem ser preenchidos"
			step 2, Administrador, "preenche dados obrigatorios e clica em Atualizar", bfs:6
		}

		exception 2, "Usuario insere algum dado invalido", {
			step 1, system, "alerta que dado e invalido"
			step 2, Administrador, "preenche dados validos e clica em Atualizar", bfs:6
		}

		postCondition "Os Parametros do NFe Reader estao atualizados."
	}
}
