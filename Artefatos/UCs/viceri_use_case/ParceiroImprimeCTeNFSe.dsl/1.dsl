system "Bazooca Test Project", {

	usecase "Parceiro Imprime CTe NFSe", {

		version "1.0", type:"Recovery", user:"SPLab", date:"07/02/2017"

		actor Parceiro, "Usuário Parceiro"
		actor system, "Bazooca"

		preCondition "Usuário Parceiro logado."

		basicFlow {
			step 1, Parceiro, "Clica na opção CT-e/NFS-e no menu principal"
			step 2, system, "apresenta uma lista com as CT-e/NFS-e disponíveis" 
			step 3, Parceiro, "clica no botão de Imprimir de uma das CTe/NFSe", af:[1,2]
			step 4, system, "apresenta uma tela com os dados em um pdf da CT-e/NFS-e selecionada"
		}

		alternative 1, "Usuario ordena lista de CT-e/NFS-e", {
			step 1, Parceiro, "clica no botão de ordenação associado a uma das colunas", bfs:2
		}
		alternative 2, "Usuario filtra lista de CT-e/NFS-e", {
			step 1, Parceiro, "insere conteúdo em um ou mais campos de filtragem", bfs:2
		}

		postCondition "Lista de CTe NFSe impressa."
	}
}
