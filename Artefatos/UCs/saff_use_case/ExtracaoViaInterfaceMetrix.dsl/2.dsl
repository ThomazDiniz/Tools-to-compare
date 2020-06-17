system "SAFF Extractor", {
    usecase "Extracao via Interface Metrix", {
        version "1.0", type:"Creation", user:"Everton", date:"24/07/2015"
        version "1.1", type:"Modification", user:"Larissa", date:"28/07/2015"
        version "2.0", type:"Modification", user:"Everton", date:"03/09/2015"
        version "2.1", type:"Modification", user:"Tiaraju", date:"15/02/2016"
        version "2.2", type:"Modification", user:"Hemã", date:"29/02/2016"


        actor administrador, "administrador do sistema"
        actor clock, "temporizador"
        actor clockOffline, "temporizador offline"


        preCondition " "

        basicFlow {
            step 1, administrador, "inicia o SAFF Extractor e se autentica", af:[3]
            step 2, system, "exibe tela de coleta automatica"
            step 3, administrador, "seleciona uma pasta contendo varias extrações, fornece as informacoes solicitadas na tela inicial e pressiona o botao 'Start'", af:[1]
            step 4, system, "bloqueia todos os botoes, com excecao do botao 'Stop'"
            step 5, clock, "a cada 10 segundos"
            step 6, system, "verifica se existem diretórios de serial number no formato correto e que foram criados a X ou mais tempo definido na propriedade AUTO_COLLECT_WAIT_TIME no arquivo conf.properties e então: envia as extracoes com essas restricoes para o servidor, transfere essas extrações(somente a pasta de serial number) para a pasta 'AUTO_COLLECT_READ_DIR/PRODUCTNUMBER'(onde o PRODUCTNUMBER é referente a cada SERIALNUMBER), atualiza o contador de extrações realizadas/enviadas e fica em espera por novas extracoes com essas mesmas restricoes na pasta indicada", "verifica se existe conexão com o servidor para enviar as extrações offline", ef:[1,2]
            step 7, administrador, "pressiona botao 'Stop'", af:[2]
            step 8, system, "desbloqueia todos os botoes e para de escutar a pasta indicada"
        }

        alternative 1, "Altera a pasta C\:\\Collect para uma pasta vazia", {
            step 1, administrador, "seleciona pasta vazia, e pressiona botao 'Start'"
            step 2, system, "fica em espera ate que alguma extracao seja adicionada na pasta indicada"
            step 3, administrador, "adiciona extracao a pasta indicada" , bfs:4
        }

        alternative 2, "Insere novas extracoes na pasta", {
            step 1, administrador, "adiciona novas extracoes na pasta indicada", bfs:4
        }

        alternative 3, "Modifica o intervalo do temporizador", {
            step 1, administrador, "modifica o valor da propriedade AUTO_COLLECT_WAIT_TIME para 60 (o valor é em segundos)", bfs:4
        }

        exception 1, "Falha no envio ao servidor", {
            step 1, system, "mantem a informacao de quais extracoes foram enviadas para o servidor; salva a extração no modo offline", bfs:5
        }

        exception 2, "Extração não se encontra em formato adequado ou o diretório do SERIALNUMBER está vazio", {
            step 1, system, "move a extração para a pasta broken"
        }

        postCondition "As extracoes da pasta indicada foram enviadas para o servidor e transferidas para a pasta 'read'"
    }
}