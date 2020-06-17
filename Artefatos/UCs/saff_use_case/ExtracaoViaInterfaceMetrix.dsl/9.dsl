system "SAFF Extractor", {
    usecase "Extracao via Interface Matrix", {
        version "1.0", type:"Creation", user:"Everton", date:"24/07/2015"

        actor administrador, "Administrador do sistema"
        actor clock, "temporizador"

        preCondition "Usuário deve estar logado no servidor e no extrator como administrador"

        basicFlow {
            step 1, administrador, "seta o extrator para iniciar em modo 'Automatic Collection' e faz login no extrator"
            step 2, system, "exibe tela inicial do extrator"
            step 3, administrador, "seleciona pasta contendo varias extracoes, seta as informacoes solicitadas na tela inicial e pressiona o botão 'Start'", af:[1]
            step 4, system, "renomeia e transfere extracoes para uma pasta temporaria; atualiza contador de extracoes realizadas; demais botoes estao todos bloqueados, com excecao do botao 'Stop'"
            step 5, clock, "a cada 30 segundos"
            step 6, system, "envia extracoes da pasta temporaria para o servidor e fica em espera por novas extracoes na pasta indicada", ef:[1], af:[2]
            step 5, administrador, "pressiona botao 'Stop'"
            step 6, system, "retorna para tela incial"
            step 5, administrador, "vai para pagina de visualizacao de extracoes no servidor"
            step 6, system, "exibe tela de visualização de extracoes com extracoes recentes no topo"
        }

        alternative 1, "Seleciona pasta vazia", {
            step 1, administrador, "seleciona pasta vazia, e pressiona botão 'Start'"
            step 2, system, "fica em espera ate que usuario insira alguma extracao na pasta indicada"
        }


        alternative 2, "Insere novas extracoes na pasta", {
            step 2, administrador, "adiciona novas extracoes na pasta indicada" , bfs:4
        }

        exception 1, "Falha no envio ao servidor", {
            step 1, system, "mantem informacao de quais extracoes foram enviadas; fica em espera ate que a conexao seja reestabelecida"
            step 2, clock, "a cada 30 segundos"
            step 3, system, "tenta enviar extracoes restantes para o servidor"
        }

        postCondition " "
    }
}