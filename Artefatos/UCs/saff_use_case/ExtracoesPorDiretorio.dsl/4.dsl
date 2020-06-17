system "SAFF Extractor", {
	usecase "Realizacao Extracoes em modo diretorio e aplicando filtros", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor administrador, "Administrador do sistema"

        actor clock, "Clock do sistema"

        preCondition "Usuário deve estar logado no servidor e extrator com administrador", "Não existem extrações cadastradas no banco de dados"

        basicFlow {
            step 1, administrador, "pressiona opção “Extract from dicrtory”"
            step 2, system, "exibe tela de extração por diretório"
            step 3, administrador, "seleciona pasta “EXTRACT_FILE_IPP320_AKIRA”, que contém 705 extrações para diversas família, e pressiona o botão “Extract”"
            step 4, system, "realiza extrações"
            step 5, clock, "tempo de execução não passou de 5 segundos", af:[8]
            step 6, system, "exibe na parte inferior da tela uma mensagem indicando que 705 extrações foram realizadas"
            step 7, administrador, "acessa página “Extractions”", af:[7]
            step 8, system, "exibe a lista de extrações com as 50 últimas entradas. Entrada 1: 14170PP30289943. Entrada 50: 12328PP30166463"
            step 9, administrador, "seleciona opção para mostrar 100 entradas por página"
            step 10, system, "exibe a lista de extrações com as 100 últimas entradas."
            step 11, administrador, "seleciona o combo box referente ao filtro por “Customer”", af:[3]
            step 12, system, "exibe as opções “Ingenico Brazil” e “Ingenico”"
            step 13, administrador, "seleciona opção “Ingenico” no campo de filtro “Customer”", af:[1,2]
            step 14, system, "atualiza a página mostrando somente 32 extrações"
        }

        alternative 8, "Estouro de limite de tempo", {
            step 1, clock, "tempo de execução passou de 5 segundos"
            step 2, system, "exibe mensagem solicitando que o usuário aguarde", bfs:7
        }

        alternative 1, "Filtro default", {
        	step 1, administrador, "seleciona opção default no campo de filtro “Customer”"
            step 2, system, "atualiza a página mostrando todas 705 extrações"
        }

        alternative 2, "Filtro “Ingenico Brazil”", {
        	step 1, administrador, "seleciona opção Ingenico Brazil no campo de filtro “Customer”"
            step 2, system, "atualiza a página mostrando todas 673 extrações"
        }

        alternative 3, "Filtro state", {
        	step 1, administrador, "seleciona combo box referente ao filtro por “State”"
            step 2, system, "exibe opções “Activated”, “Alert Interruption”, “Deactivated”, “Mockup” e “Error”"
            step 3, administrador, "seleciona opção “Activated” no campo de filtro “State”", af:[4,5,6]
            step 4, system, "atualiza página mostrando 608 extrações"
        }

        alternative 4, "Filtro “Alert Interruption”", {
        	step 1, administrador, "seleciona opção “Alert Interruption” no campo de filtro “State”"
            step 2, system, "atualiza página mostrando 97 extrações"
        }

        alternative 5, "Filtro “Mockup”", {
        	step 1, administrador, "seleciona opção “Mockup” no campo de filtro “State”"
            step 2, system, "atualiza página mostrando lista vazia"
        }

        alternative 6, "Filtro “Error”", {
        	step 1, administrador, "seleciona opção “Error” no campo de filtro “State”"
            step 2, system, "atualiza página mostrando lista vazia"
        }

        alternative 7, "Extrações Sequenciais", {
        	step 1, administrador, "pressiona opção “Extract from dicrtory”"
            step 2, system, "exibe tela de extração por diretório"
            step 3, administrador, "seleciona pasta “EXTRACT_FILE_IPP320_AKIRA”, que contém 705 extrações para diversas família, e pressiona o botão “Extract”"
            step 4, system, "realiza extrações"
            step 5, clock, "verifica se o tempo de execução não passou de 5 segundos"
            step 6, system, "exibe na parte inferior da tela uma mensagem indicando que 705 extrações foram realizadas"
            step 7, administrador, "acessa página “Extractions”"
            step 8, system, "exibe uma lista com 1510"
        }

        postCondition " "
    }
}