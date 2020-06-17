 system "SAFF Extractor", {
 	usecase "Pesquisar por extracao", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor administrador, "Administrador do sistema"

        preCondition "Usuário deve estar logado com perfil de administrador", "Deve existir ao menos uma extração cadastrada"

        basicFlow {
            step 1, administrador, "digita no campo “Product Number” o número de produto e o número serial correspondente e pressiona o botão 'Search'", af:[1] 
            step 2, system, "exibe tela correspondente a extração"
        }

        alternative 1, "Product Number ou Serial Number inválidos", {
            step 1, administrador, "digita o product number e/ou número serial inválidos e pressiona o botão 'Search'" 
            step 2, system, "exibe mensagem “No extraction found. Please, insert a Serial Number to search for the last extraction.”", bfs:1
        }
        postCondition " "
    }
 }