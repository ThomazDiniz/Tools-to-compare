system "SAFF Extractor", {
    usecase "Extracao em modo LLT", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"
        version "2.0", type:"Modification", user:"Everton", date:"03/09/2015"

        actor operador, "Operador do sistema"

        preCondition " " 

        basicFlow {
            step 1, operador, "inicia o SAFF Extractor e se autentica"
            step 2, system, "exibe pagina que requisita dados do terminal"
            step 3, operador, "escolhe opcao Pre_Test para tipo de teste", af:[2,3,4,5,7,8]
            step 4, system, "apresenta a marcacao da opcao escolhida"
            step 5, operador, "digita um product number e serial number validos e pressiona Extract (terminal em modo LLT)", af:[1,6,9,10]
            step 6, system, "realiza a extração, a envia para o servidor, e a salva nas pastas de backup local ('Backup' e 'Results')", ef:[2,3,4,1,5]
            step 7, operador, "loga no servidor e vai ate a pagina de extracoes"
            step 8, system, "exibe lista que inclui a extracao realizada"
        }

        exception 1, "Nao existe porta USB cadastrada", {
            step 1, system, "exibe mensagem solicitando informando não existe porta USB cadastrada", bfs:3
        }

        exception 2, "Falha no envio para servidor e Usuário não deseja fazer extração offline", {
            step 1, system, "exibe mensagem informando que houve erro na conexão com o servidor e pergunta se usuario deseja fazer a extração em modo offline"
            step 2, operador, "responde No"
            step 3, system, "fecha janela e retorna a pagina que requisita dados do terminal", bfs:5
        }

        exception 3, "Falha no envio para servidor e Usuário deseja fazer extração offline", {
            step 1, system, "exibe mensagem informando que houve erro na conexão com o servidor e pergunta se usuario deseja fazer a extração em modo offline"
            step 2, operador, "responde Yes"
            step 3, system, "exibe pagina que requisita dados do terminal"
            step 4, operador, "configura o teste, insere product number e serial number válidos inicia a extracao"
            step 5, system, "salva extração em pasta local"
        }

        exception 4, "Dados de terminal inválidos", {
            step 1, system, "exibe mensagem informando que dados do terminal estão incorretos", bfs:5
        }        

        exception 5, "Nao existe terminal conectado", {
            step 1, system, "exibe mensagem informando que não conseguiu se conectar ao terminal", bfs:1
        } 

        alternative 1, "Terminal nao se encontra em modo LLT",{
        	step 1, operador, "conecta terminal em porta USB e o coloca em modo LLT"          
            step 2, system, "(terminal) entra em modo LLT", bfs:5
        }

        alternative 2, "Test 1",{
        	step 1, operador, "marca opcao Test 1 para tipo de teste", bfs:4
        }

        alternative 3, "Test 2",{
        	step 1, operador, "marca opcao Test 2 para tipo de teste", bfs:4
        }

        alternative 4, "QA",{
        	step 1, operador, "marca opcao QA para tipo de teste", bfs:4
        }

        alternative 5, "Note",{
        	step 1, operador, "insere uma anotacao para a extracao", bfs:4
        }

        alternative 6, "Uso do leitor de codigo de barras",{
        	step 1, operador, "le (via leitor de codigo de barras) um product number e serial number validos", bfs:6
        }

        alternative 7, "Redirect",{
        	step 1, operador, "marca a opcao 'Redirect to the display of data'"
        	step 2, system, "apresenta a marcacao da opcao escolhida"
            step 3, operador, "digita um product number e serial number validos e pressiona Extract (terminal em modo LLT)"
            step 4, system, "realiza a extracao, a envia para o servidor, a salva nas pastas de backup local e abre o browser mostrando a extracao realizada"
        }

        alternative 8, "Disable LLT",{
        	step 1, operador, "marca a opcao 'Disable LLT'"
        	step 2, system, "apresenta a marcacao da opcao escolhida"
            step 3, operador, "digita um product number e serial number validos e pressiona Extract"
            step 4, system, "realiza uma extracao Disabled LLT, a envia para o servidor, e a salva nas pastas de backup local"
        }

        alternative 9, "Product number e/ou serial number invalidos",{
        	step 1, operador, "digita um product number e/ou serial number invalidos"
        	step 2, system, "marca campo em vermelho alertando do erro", bfs:5
        }

        alternative 10, "Product number e serial number que nao casam",{
        	step 1, operador, "digita um product number e serial number validos mas nao referentes a mesma familia e pressiona Extract (terminal em modo LLT)"
        	step 2, system, "apresenta mensagem de erro", bfs:3
        }

        postCondition "extracao realizada", "extracao pode ser visualizada via servidor", "extracao salva nas pastas de backup local ('Backup' e 'Results')"
    }
}