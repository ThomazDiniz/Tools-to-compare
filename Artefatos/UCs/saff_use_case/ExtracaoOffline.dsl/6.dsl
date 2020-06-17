system "SAFF Extractor", {
	usecase "Extracao Offline", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"
        version "2.0", type:"Modification", user:"Everton", date:"03/09/2015"

        actor operador, "operador do sistema"

        preCondition " "

        basicFlow {
            step 1, operador, "inicia o SAFF Extractor e se autentica"
            step 2, system, "exibe pagina que requisita dados do terminal"
            step 1, operador, "abre extrator"
            step 2, system, "exibe tela de login"
            step 3, operador, "loga no extrator", af:[1]
            step 4, system, "exibe tela inicial 'SAFF extraction'", ef:[1,2]
        }

        exception 1, "Sem conexao e usuario deseja entrar em modo offline ", {
            step 1, system, "exibe mensagem solicitando confirmacao se usuario quer entrar em modo offline"
            step 2, operador, "confirma que quer entrar em modo offline"
            step 3, system, "exibe pagina que requisita dados do terminal"
            step 4, operador, "realiza uma serie de extracoes sequenciais"
            step 5, system, "salva as extracoes na pasta local 'OfflineExtraction'" 
            step 6, operador, "reastabelece conexao"
            step 7, system, "envia extracoes locais para o servidor e as apaga da pasta local 'OfflineExtraction'", ef:[3]
            step 8, operador, "loga no servidor e vai ate a pagina de extracoes"
            step 9, system, "exibe lista com extracoes realizadas no modo offline"
        }

        exception 2, "Sem conexao e usuario nao deseja entrar em modo offline ", {
            step 1, system, "exibe mensagem solicitando confirmação se usuario quer entrar em modo offline"
            step 2, operador, "nao deseja entrar em modo offline", bfs:2
        }

        exception 3, "Cai conexao novamente", {
            step 1, system, "mantem informacao das extracoes nao enviadas a tempo na pasta local"
            step 2, operador, "reastabelece conexao"
            step 3, system, "envia extracoes restantes da pasta local para o servidor e as apaga da pasta 'OfflineExtraction'"
            step 4, operador, "loga no servidor e vai ate a pagina de extracoes"
            step 5, system, "exibe lista que contem as extracoes realizadas no modo offline"
        }

        alternative 1, "Offline sempre", {
            step 1, operador, "define que o sistema sempre fara extracoes offline"
            step 2, system, "exibe pagina que requisita dados do terminal"
            step 3, operador, "realiza uma serie de extracoes"
            step 4, system, "salva as extracoes na pasta local 'OfflineExtraction'" 
        }

        postCondition "extracoes foram realizadas (tempo de cada extracao deve ser o momento que esta foi feita em modo offline)"
    }
}