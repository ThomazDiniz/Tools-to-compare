system "SAFF Extractor", {
	usecase "Extracao Offline", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor administrador, "Administrador do sistema"

        preCondition "Usuário não está logado no servidor"

        basicFlow {
            step 1, administrador, "loga no extrator"
            step 2, system, "exibe exibe mensagem perguntando se o usuário deseja entrar em modo offline"
            step 3, administrador, "pressiona botão Yes", af:[1]
            step 4, system, "exibe tela inicial 'SAFF extraction'"
            step 5, administrador, "insere um 'Product number', 'Serial number', tipo de teste 'Pre_test' e pressiona 'Extract'", af:[2,3,4,5]
            step 6, system, "adiciona nova extração a pasta local'"
            step 7, administrador, "loga no servidor"
            step 8, system, "envia extrações da pasta local para o servidor e as deleta da máquina local", ef:[2]
            step 9, administrador, "vai até a página de extrações"
            step 10, system, "exibe lista com a extração realizada no modo offline no topo"
        }

        alternative 1, "Pressiona NO", {
            step 1, administrador, "pressiona botão No"
            step 2, system, "Fecha janela de mensagem", bfs:1
        }

        alternative 2, "Test 1", {
            step 1, administrador, "insere um 'Product number', 'Serial number', tipo de teste 'Test 1' e pressiona 'Extract'", bfs:6
        }

        alternative 3, "Test 2", {
            step 1, administrador, "insere um 'Product number', 'Serial number', tipo de teste 'Test 2' e pressiona 'Extract'", bfs:6
        }

        alternative 4, "QA", {
            step 1, administrador, "insere um 'Product number', 'Serial number', tipo de teste 'QA' e pressiona 'Extract'", bfs:6
        }

        alternative 5, "Product number ou serial number inválidos", {
            step 1, administrador, "insere um 'Product number' ou 'Serial number' inválidos e pressiona 'Extract'"
            step 2, system, "exibe mensagem solicitando informando que o product number ou serial number são inválidos", bfs:5
        }

        exception 2, "Cai conexão com servidor", {
            step 1, system, "exibe mensagem informando quantas extrações foram transferidas para o servidor com sucesso e deleta da pasta local as extrações enviadas com sucesso", bfs:5
        }

        postCondition " "
    }
}