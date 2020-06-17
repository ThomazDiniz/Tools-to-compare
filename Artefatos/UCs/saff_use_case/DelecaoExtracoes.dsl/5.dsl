system "SAFF Extractor", {
	usecase "Delecao de Extracoes", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor administrador, "Administrador do sistema"

        preCondition "Usuário deve estar logado no servidor e extrator como administrador", "705 extrações já realizadas (pasta “EXTRACT_FILE_IPP320_AKIRA”)"

        basicFlow {
            step 1, administrador, "seleciona o check box referente a extração referente ao número serial 12311PP30154516”", af:[2,3]
            step 2, system, "marca seleção com um tick"
            step 3, administrador, "pressiona o botão “Delete extractions”"
            step 4, system, "exibe uma mensagem pop-up solicitando a confirmação da deleção"
            step 5, administrador, "confirma deleção", af:[1]
            step 6, system, "exibe a lista de extrações com 704 entradas"
        }

        alternative 1, "Cancela deleção", {
        	step 1, administrador, "cancela deleção"
            step 2, system, "fecha janela pop-up", bfs:1
        }

        alternative 2, "Realiza Filtro e deleção", {
        	step 1, administrador, "seleciona combo box referente ao filtro por “State”"
            step 2, system, "exibe opções “Activated”, “Alert Interruption”, “Deactivated”, “Mockup” e “Error”"
            step 3, administrador, "seleciona opção “Activated” no campo de filtro “State”"
            step 4, system, "atualiza página mostrando 608 extrações"
            step 5, administrador, "seleciona o check box que marca todas extrações para deleção"
            step 6, system, "marca todas extrações após o filtro com um tick"
            step 7, administrador, "pressiona o botão “Delete extractions”"
            step 8, system, "exibe uma mensagem pop-up solicitando a confirmação da deleção"
            step 9, administrador, "confirma deleção"
            step 10, system, "exibe a lista de extrações com 96 entradas"
        }

        alternative 3, "Deleta todas extrações", {
        	step 1, administrador, "seleciona o check box que marca todas extrações para deleção"
            step 2, system, "marca o check box com um tick"
            step 3, administrador, "pressiona o botão “Delete extractions”"
            step 4, system, "exibe uma mensagem pop-up indicando que não existem extrações para serem deletadas"
        }

        postCondition " "
    }
}