system "SAFF", {
    usecase "Visualizacao de Extracoes e outras Features", {
        version "1.0", type:"Creation", user:"Everton", date:"23/09/2015"

        actor administrador, "Administrador ou Super administrador do sistema"
        actor super, "Super administrador do sistema"
        actor opManSV, "Operador, Manager ou Super-viewer do sistema"

        preCondition "Usuario deve estar logado no servidor", "ja existem diversas extracoes registradas" 

        basicFlow {
            step 1, administrador, "acessa tela de exibicao de extracoes"
            step 2, system, "exibe tela com a lista de extracoes realizadas"
            step 3, administrador, "seleciona uma extracao", af:[1,2,3,4,5]
            step 4, system, "exibe extracao selecionada"
        }

        alternative 1, "Edicao de Note", {
            step 1, administrador, "clica no campo Note de uma extracao"
            step 2, system, "permite a edicao no note"
            step 3, administrador, "modifica o valor do Note e clica fora da area de edicao ou pressiona tecla tab" 
            step 4, system, "atualiza campo note da extracao", bfs:3
        } 

        alternative 2, "Download CSV", {
            step 1, super, "clica no botao 'Download CSV'"
            step 2, system, "cria arquivo csv e pergunta onde este deve ser salvo"
            step 3, super, "escolhe pasta destino" 
            step 4, system, "salva arquivo na pasta selecionada", bfs:3
        } 

        alternative 3, "Selecao tabela", {
            step 1, administrador, "clica no botao 'Selecionar Tabela'"
            step 2, system, "como selecionado a tabela de extracoes em exibicao", bfs:3
        } 

        alternative 4, "Internacionalizacao", {
            step 1, administrador, "clica no de Ajustes de Usuario, opcao Idioma, e altera o idioma"
            step 2, system, "atualiza todos os menus, campos, opcoes e elementos com a correspondente traducao segundo o novo idioma. Apenas os dados das extracoes permanecem com idioma inalterado", bfs:3
        } 

        alternative 5, "Tentativa de Edicao de Note sem permissao", {
            step 1, opManSV, "clica no campo Note de uma extracao"
            step 2, system, "nao permite a edicao no note", bfs:3
        } 

        postCondition " "
    }
}