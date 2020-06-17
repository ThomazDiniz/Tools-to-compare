 system "SAFF Extractor", {
 	usecase "Pesquisar por extracao", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor administrador, "Administrador do sistema"

        preCondition "Usuário deve estar logado com perfil de administrador", "Deve existir ao menos uma extracao cadastrada"

        basicFlow {
            step 1, administrador, "digita no campo “Product Number” o numero de produto e o numero serial correspondente e pressiona o botao 'Search'", af:[1] 
            step 2, system, "exibe tela correspondente a extracao"
        }

        alternative 1, "Product Number ou Serial Number invalidos", {
            step 1, administrador, "digita o product number e/ou numero serial invalidos e pressiona o botao 'Search'" 
            step 2, system, "exibe mensagem que product number ou serial number sao invalidos", bfs:1
        }
        postCondition " "
    }
 }