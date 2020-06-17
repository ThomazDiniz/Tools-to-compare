system "SAFF Extractor", {
    usecase "Extracao via Interface Matrix", {
        version "1.0", type:"Creation", user:"Everton", date:"24/07/2015"
        version "1.1", type:"Modification", user:"Larissa", date:"28/07/2015"


        actor administrador, "Administrador do sistema"
        actor clock, "temporizador"

        preCondition "Usuario deve estar logado como administrador"

        basicFlow {
            step 1, administrador, "configura o extrator para iniciar em modo 'Automatic Collection'"
            step 2, system, "exibe tela de login"
            step 3, administrador, "faz login no extrator"
            step 4, system, "exibe tela de coleta automatica"
            step 5, administrador, "seleciona uma pasta contendo varias extracoes, seta as informacoes solicitadas na tela inicial e pressiona o botao 'Start'", af:[1]
            step 6, system, "bloqueia todos os botoes, com excecao do botao 'Stop'"
            step 7, clock, "a cada 30 segundos"
            step 8, system, "envia extracoes para o servidor, transfere essas extrações para a pasta 'read', atualiza o contador de extrações realizadas e fica em espera por novas extracoes na pasta indicada", ef:[1]
            step 9, administrador, "pressiona botao 'Stop'", af:[2]
            step 10, system, "desbloqueia todos os botoes e para de escutar a pasta indicada"
        }

        alternative 1, "Seleciona pasta vazia", {
            step 1, administrador, "seleciona pasta vazia, e pressiona botao 'Start'"
            step 2, system, "fica em espera ate que alguma extracao seja adicionada na pasta indicada"
            step 3, administrador, "adiciona extracao a pasta indicada" , bfs:6
        }


        alternative 2, "Insere novas extracoes na pasta", {
            step 1, administrador, "adiciona novas extracoes na pasta indicada", bfs:6
        }

        exception 1, "Falha no envio ao servidor", {
            step 1, system, "mantem a informacao de quais extracoes foram enviadas para o servidor; fica em espera ate que a conexao seja reestabelecida"
            step 2, clock, "a cada 30 segundos"
            step 3, system, "tenta enviar extrações restantes para o servidor", bfs:7
        }

        postCondition "As extracoes da pasta indicada devem ter sido enviadas para o servidor e transferidas para a pasta 'read'"
    }
}