system "Bazooca", {

	usecase "Usuario Loga", {

		version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

		actor bazoocaUser, "Usuario Bazooca"
		actor system, "Bazooca"

		preCondition "Acesso ao Browser; Acesso a internet."

		basicFlow {
			step 1, bazoocaUser, 	"entra na homepage do sistema"
			step 2, system, 		"exibe homepage"
			step 3, bazoocaUser, 	"clica no botao 'Login'"
			step 4, system, 		"apresenta um form com os campos username e password e um botao de submissao"
			step 5, bazoocaUser, 	"preenche os campos de username e password e clica no botao de submissao", af:[1,2]
			step 6, system, 		"mostra uma mensagem de usuario logado com sucesso", ef:[1,2]
		}

		alternative 1, "Um ou mais username sao apresentados", {
			step 1, bazoocaUser, "seleciona um dos usernames sugeridos, digita um password e clica no botao de submeter", bfs:4
		}

		alternative 2, "esqueceu credenciais", {
			step 1, bazoocaUser, "clica no botao 'Esqueceu sua senha?'"
			step 2, system, "pede para usuario inserir email de cadastro"
			step 3, bazoocaUser, "usuario clica em botao 'Confirmar'", bfs:1
		}

		exception 1, "usuario nao existe no banco de dados", {
			step 1, system, "alerta que usuario nao existe", bfs:3
		}

		exception 2, "combinacao de username/password incorreta", {
			step 1, system, "alerta que username e/ou password estao incorretos", bfs:3
		}

		postCondition "Usuario esta logado no sistema."
	}
}
