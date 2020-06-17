system "SAFF Extractor", {
	usecase "Delecao de Extracoes", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor administrador, "Administrador do sistema"

        preCondition "Usuario deve estar logado no servidor", "705 extracoes ja foram realizadas (pasta “EXTRACT_FILE_IPP320_AKIRA”)"

        basicFlow {
            step 1, administrador, "seleciona o check box referente a extracao referente ao numero serial 12311PP30154516”", af:[2,3]
            step 2, system, "marca selecao com um tick"
            step 3, administrador, "pressiona o botao “Delete extractions”"
            step 4, system, "exibe uma mensagem pop-up solicitando a confirmação da delecao"
            step 5, administrador, "confirma delecao", af:[1]
            step 6, system, "exibe a lista de extracoes com 704 entradas"
        }

        alternative 1, "Cancela delecao", {
        	step 1, administrador, "cancela delecao"
            step 2, system, "fecha janela pop-up", bfs:1
        }

        alternative 2, "Realiza Filtro e delecao", {
        	step 1, administrador, "seleciona combo box referente ao filtro por “State”"
            step 2, system, "exibe opcoes “Activated”, “Alert Interruption”, “Deactivated”, “Mockup” e “Error”"
            step 3, administrador, "seleciona opcao “Activated” no campo de filtro “State”"
            step 4, system, "atualiza pagina mostrando 608 extracoes"
            step 5, administrador, "seleciona o check box que marca todas extracoes para delecao"
            step 6, system, "marca todas extracoes após o filtro com um tick"
            step 7, administrador, "pressiona o botao “Delete extractions”"
            step 8, system, "exibe uma mensagem pop-up solicitando a confirmacao da delecao"
            step 9, administrador, "confirma delecao"
            step 10, system, "exibe a lista de extracoes com 96 entradas"
        }

        alternative 3, "Deleta todas extracoes", {
        	step 1, administrador, "seleciona o check box que marca todas extracoes para delecao"
            step 2, system, "marca o check box com um tick"
            step 3, administrador, "pressiona o botao “Delete extractions”"
            step 4, system, "exibe uma mensagem pop-up indicando que nao existem extracoes para serem deletadas"
        }

        postCondition " "
    }
}