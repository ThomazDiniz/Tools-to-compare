system "Bazooca", {

	usecase "Login De Usuario", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor bazoocaUser, "Bazooca User"
		actor system, "Bazooca"

		preCondition "Acesso ao Browser; Acesso a internet."

		basicFlow {
			step 1, bazoocaUser, 	"Entra na tela de login"
			step 2, system, 		"apresenta um form com os campos username e password e um botão de submissão"
			step 3, bazoocaUser, 	"preenche os campos de username e password e clica no botão de submissão", af:[1]
			step 4, system, 		"mostra uma mensagem de usuário logado com sucesso", ef:[1,2]
		}

		alternative 1, "Um ou mais username são apresentados", {
			step 1, bazoocaUser, "seleciona um dos usernames sugeridos, digita um password e clica no botão de submeter", bfs:4
		}

		exception 1, "Usuário não existe no banco de dados", {
			step 1, system, "alerta que usuário não existe", bfs:3
		}

		exception 2, "Combinação de username/password incorreta", {
			step 1, system, "alerta que username e/ou password estão incorretos", bfs:3
		}

		postCondition "Usuario logado no sistema."
	}
}
