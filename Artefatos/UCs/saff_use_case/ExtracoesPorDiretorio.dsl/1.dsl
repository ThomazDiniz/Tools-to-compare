system "SAFF Extractor", {
	usecase "Realizacao Extracoes em modo diretorio e aplicando filtros", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"
        version "1.1", type:"Modification", user:"Kallynny", date:"24/02/2016"

        actor administrador, "Administrador do sistema"

        preCondition "Usuário deve estar logado no servidor e extrator com administrador", "Nao existem extrações cadastradas no banco de dados"

        basicFlow {
            step 1, administrador, "pressiona opcao “Extract from directory”"
            step 2, system, "exibe tela de extracao por diretorio"
            step 3, administrador, "seleciona pasta “EXTRACT_FILE_IPP320_AKIRA”, que contem 703 extrações para diversas familias, e pressiona o botao “Extract”"
            step 4, system, "exibe na parte inferior da tela uma mensagem indicando que 703 extrações foram realizadas"
            step 5, administrador, "acessa pagina “Extractions” e seleciona opção para mostrar 50 entradas por página", af:[7]
            step 6, system, "exibe a lista de extrações com as 50 ultimas entradas. Entrada 1: 14170PP30289943. Entrada 50: 12328PP30166463"
            step 7, administrador, "seleciona opcao para mostrar 100 entradas por pagina"
            step 8, system, "exibe a lista de extrações com as 100 ultimas entradas."
            step 9, administrador, "seleciona o combo box referente ao filtro por “Customer”", af:[3]
            step 10, system, "exibe as opcoes “Ingenico Brazil” e “Ingenico”"
            step 11, administrador, "seleciona opcao “Ingenico” no campo de filtro “Customer”", af:[1,2]
            step 12, system, "atualiza a pagina mostrando somente 32 extrações"
        }

        alternative 1, "Filtro default", {
        	step 1, administrador, "seleciona opcao default no campo de filtro “Customer”"
            step 2, system, "atualiza a pagina mostrando todas 703 extrações"
        }

        alternative 2, "Filtro “Ingenico Brazil”", {
        	step 1, administrador, "seleciona opção Ingenico Brazil no campo de filtro “Customer”"
            step 2, system, "atualiza a pagina mostrando 673 extracoes"
        }

        alternative 3, "Filtro state", {
        	step 1, administrador, "seleciona combo box referente ao filtro por “State”"
            step 2, system, "exibe opcoes “Activated”, “Alert Interruption”, “Deactivated”, “Mockup” e “Error”"
            step 3, administrador, "seleciona opcao “Activated” no campo de filtro “State”", af:[4,5,6]
            step 4, system, "atualiza pagina mostrando 608 extrações"
        }

        alternative 4, "Filtro “Alert Interruption”", {
        	step 1, administrador, "seleciona opcao “Alert Interruption” no campo de filtro “State”"
            step 2, system, "atualiza pagina mostrando 97 extracoes"
        }

        alternative 5, "Filtro “Mockup”", {
        	step 1, administrador, "seleciona opcao “Mockup” no campo de filtro “State”"
            step 2, system, "atualiza pagina mostrando lista vazia"
        }

        alternative 6, "Filtro “Error”", {
        	step 1, administrador, "seleciona opcao “Error” no campo de filtro “State”"
            step 2, system, "atualiza pagina mostrando extrações associadas aos estados 'Alert Interruption' e 'Mockup'"
        }

        alternative 7, "Extracoes Sequenciais", {
        	step 1, administrador, "pressiona opcao “Extract from directory”"
            step 2, system, "exibe tela de extracao por diretorio"
            step 3, administrador, "seleciona pasta “EXTRACT_FILE_IPP320_AKIRA”, que contém 703 extrações para diversas família, e pressiona o botão “Extract”"
            step 4, system, "exibe na parte inferior da tela uma mensagem indicando que 703 extrações foram realizadas"
            step 5, administrador, "acessa pagina “Extractions”"
            step 6, system, "exibe uma lista com 1510"
        }

        postCondition " "
    }
}