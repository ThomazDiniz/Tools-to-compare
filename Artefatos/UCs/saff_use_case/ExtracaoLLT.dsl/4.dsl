system "SAFF Extractor", {
    usecase "Extracao em modo LLT", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor administrador, "Administrador do sistema"

        preCondition "Usuário deve estar logado no servidor como administrador", "Não existem extrações cadastradas no banco de dados" 

        basicFlow {
            step 1, administrador, "conecta um terminal em uma porta USB previamente cadastrada e o coloca em modo LLT"
            step 2, system, "entra em modo LLT", ef:[1,5]
            step 3, administrador, "inicia o SAFF Extractor e se autentica"
            step 4, system, "exibe página que requisita dados do terminal", ef:[2]
            step 5, administrador, "digita o product number e serial number válidos e pressiona tecla Tab"
            step 6, system, "muda foco para campo referente ao tipo de teste"
            step 7, administrador, "escolhe opção Test1 para tipo de teste e pressiona botão 'Extract'"
            step 6, system, "realiza a extração", ef:[3,4,6]
        }

        exception 1, "Não existe porta USB cadastrada", {
            step 1, system, "exibe mensagem solicitando informando não existe porta USB cadastrada", bfs:1
        }

        exception 2, "Login ou senha incorretos", {
            step 1, system, "exibe mensagem informando que login ou senha estão incorretos", bfs:3
        }

        exception 3, "Falha no envio para servidor e Usuário deseja fazer extração offline", {
            step 1, system, "exibe mensagem informando houve erro na conexão com o servidor e pergunta se usuário deseja fazer a extração em modo offline"
            step 2, administrador, "responde Yes"
            step 3, system, "realiza extração em modo offline"
        }

        exception 4, "Dados de terminal inválidos", {
            step 1, system, "exibe mensagem informando que dados do terminal estão incorretos", bfs:5
        }        

        exception 5, "Não existe terminal conectado", {
            step 1, system, "exibe mensagem informando que não conseguiu se conectar ao terminal", bfs:1
        } 

    
    	exception 6, "Falha no envio para servidor e Usuário não deseja fazer extração offline", {
            step 1, system, "exibe mensagem informando houve erro na conexão com o servidor e pergunta se usuário deseja fazer a extração em modo offline"
            step 2, administrador, "responde No"
            step 3, system, "fecha janela e retorna a página de inserção de dados", bfs:5
        }

        postCondition " "
    }
}