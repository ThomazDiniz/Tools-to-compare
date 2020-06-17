system "SAFF Extractor", {
	usecase "Extracao Offline", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor administrador, "Administrador do sistema"

        preCondition "Usuário está logado no servidor"

        basicFlow {
            step 1, administrador, "loga no extrator", af[2]
            step 2, system, "exibe tela inicial 'SAFF extraction'", ef:[1]
        }

        exception 1, "Cai conexão ", {
            step 2, administrador "confirma que quer entrar em modo offline", af[1]
            step 3, system, "exibe tela inicial 'SAFF extraction'"
            step 4, administrador, "realiza cinco extrações"
            step 5, system, "adiciona novas extrações a pasta local'" 
            step 6, administrador, "reastabelece conexão"
            step 7, system, "envia extrações locais para o servidor e as apaga da pasta local"
            step 8, administrador, "loga no servidor e vai até a página de extrações"
            step 9, system, "exibe lista com extrações realizada no modo offline no topo"
        }

        alternative 1, "Pressiona NO", {
            step 1, administrador, "Não deseja entrar em modo offline", bfs:2
        }


        alternative 2, "Offline sempre", {
            step 1, administrador, "define que o sistema sempre fará extrações offline"
            step 2, system, "exibe tela inicial 'SAFF extraction'"
            step 3, administrador, "realiza cinco extrações"
            step 4, system, "adiciona novas extrações a pasta local'" 

        postCondition " "
    }
}