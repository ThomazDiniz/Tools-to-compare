system "SAFF", {
    usecase "Filtro de Extracoes", {
        version "1.0", type:"Creation", user:"Everton", date:"23/09/2015"

        actor operador, "Operador do sistema"
        actor superAdminViewer, "Super administrador do sistema ou Super-viewer"
        actor adminManager, "Administrador do sistema ou Manager"

        preCondition "Operador deve estar logado no servidor", "ja existem diversas extracoes registradas" 

        basicFlow {
            step 1, operador, "acessa tela de exibicao de extracoes"
            step 2, system, "exibe tela com lista de extracoes realizadas"
            step 3, operador, "seleciona datas personalizadas (inicial e final) para filtro", af:[1,2,3,4,5,6,7,8]
            step 4, system, "exibe as data selecionadas"
            step 5, operador, "preenche os campos de filtro (somente Product Number e Serial Number) e manda aplicar filtro", af:[10,11,12]
            step 6, system, "atualiza os campos de filtro, mostrando em destaque o valor escolhido; atualiza a lista de extracoes mostrando apenas aquelas condizentes com o filtro solicitado"
            step 7, operador, "seleciona uma extracao", af:[9]
            step 8, system, "exibe extracao selecionada"
            step 9, operador, "retorna para tela de exibicao de extracoes"
            step 10, system, "exibe lista de extracoes preservando o filtro aplicado anteriormente"

        }

        alternative 1, "Datas default", {
            step 1, operador, "nao seleciona datas para filtro"
            step 2, system, "exibe a selecao da a data de hoje para as datas inicio e fim", bfs:5
        } 

        alternative 2, "Ontem", {
            step 1, operador, "seleciona opcao 'Ontem' como data de selecao do filtro"
            step 2, system, "exibe a selecao da opcao ontem como data de selecao de filtro", bfs:5
        }  

        alternative 3, "Ultimos 7 dias", {
            step 1, operador, "seleciona opcao 'Ultimos 7 dias' como data de selecao do filtro"
            step 2, system, "exibe a selecao da opcao Ultimos 7 dias como data de selecao de filtro", bfs:5
        }  

        alternative 4, "Ultimos 30 dias", {
            step 1, operador, "seleciona opcao 'Ultimos 30 dias' como data de selecao do filtro"
            step 2, system, "exibe a selecao da opcao Ultimos 30 dias como data de selecao de filtro", bfs:5
        }  

        alternative 5, "Esse mes", {
            step 1, operador, "seleciona opcao 'Esse mes' como data de selecao do filtro"
            step 2, system, "exibe a selecao da opcao Esse mes como data de selecao de filtro", bfs:5
        }  

        alternative 6, "Mes passado", {
            step 1, operador, "seleciona opcao 'Mes passado' como data de selecao do filtro"
            step 2, system, "exibe a selecao da opcao Mes passado como data de selecao de filtro", bfs:5
        }        

        alternative 7, "Somente data inicio", {
            step 1, operador, "seleciona somente a data inicio"
            step 2, system, "mantem datas que estavam selecionadas anteriormente. Se nao existia data selecionada, a aparece a data default", bfs:5
        } 

        alternative 8, "Somente data final", {
            step 1, operador, "seleciona somente a data final"
            step 2, system, "mantem datas que estavam selecionadas anteriormente. Se nao existia data selecionada, a aparece a data default", bfs:5
        } 

        alternative 9, "Filtro apos log off", {
            step 1, operador, "faz log off"
            step 2, system, "exibe tela inicial de login"
            step 3, operador, "faz log in"
            step 4, system, "exibe lista de extracoes preservando o filtro aplicado anteriormente"
        }  

        alternative 10, "Opcoes de filtro para Super administrador e Super-viewer", {
            step 1, superAdminViewer, "preenche os campos de filtro (todas opcoes de filtro aparecem, incluindo filtro de laboratorio) e manda aplicar filtro", bfs:6
        }  

        alternative 11, "Opcoes de filtro para Administrador e Manager", {
            step 1, adminManager, "preenche os campos de filtro (filtro de laboratorio nao aparece) e manda aplicar filtro", bfs:6
        }  

        alternative 12, "Sem filtros", {
            step 1, operador, "nao preenche os campos de filtro e manda aplicar filtro"
            step 2, system, "mostra lista completa de de extracoes", bfs:7
        }  

        postCondition " "
    }
}