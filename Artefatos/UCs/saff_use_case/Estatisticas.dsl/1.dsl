system "SAFF", {
    usecase "Estatisticas", {
        version "1.0", type:"Creation", user:"Everton", date:"23/09/2015"

        actor administrador, "Administrador ou Super administrador do sistema"

        preCondition "Usuario deve estar logado no servidor", "ja existem diversas extracoes registradas" 

        basicFlow {
            step 1, administrador, "acessa tela de exibicao de extracoes"
            step 2, system, "exibe tela com a lista de extracoes realizadas"
            step 3, administrador, "seleciona opcao Estatisticas", af:[2]
            step 4, system, "Mostra lista de todas extracoes realizadas ate o ultimo update e exibe campos para criacao de estatisticas das extracoes (mesmos campos da tela de filtros + Data de Fabricacao + Secu Info)"
            step 5, administrador, "preenche os campos que deseja ter estatisticas e pressiona botao Estatisticas", af:[1,3,4]
            step 6, system, "gera os graficos correspondentes aos campos solicitados"
        }

        alternative 1, "Filtro", {
            step 1, administrador, "preenche os campos que deseja ter estatisticas e pressiona botao Filtrar"
            step 2, system, "atualiza a lista de extracoes mostrando apenas aquelas condizentes com o filtro solicitado"
            step 3, administrador, "pressiona botao Estatisticas", bfs:6
        } 

        alternative 2, "Esconder Filtro", {
            step 1, administrador, "pressiona link 'Esconder Filtro'"
            step 2, system, "esconde campos de filtro"
            step 3, administrador, "pressiona link 'Esconder Filtro'"
            step 4, system, "exibe novamente campos de filtro", bfs:5
        } 

        alternative 3, "Limpar", {
            step 1, administrador, "preenche os campos que deseja ter estatisticas e pressiona botao Limpar"
            step 2, system, "limpa todos os campos de filtro", bfs:5
        } 

        alternative 4, "Sem filtros", {
            step 1, administrador, "nao preenche os campos de fitro e pressiona botao Estatisticas"
            step 2, system, "gera os graficos correspondentes a todas extracoes ate o ultimo update"
        } 

        postCondition " "
    }
}