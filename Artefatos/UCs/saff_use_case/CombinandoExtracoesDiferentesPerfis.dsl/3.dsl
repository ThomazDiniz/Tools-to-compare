system "SAFF Extractor", {
	usecase "Combinando extracoes com diferente perfis", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor administrador, "Administrador do sistema"

        preCondition "Usuário deve estar logado no servidor e extrator como administrador", "Deve existir um usuário cadastrado com perfil de operador"

        basicFlow {
            step 1, administrador, "pressiona opção “Extract from dicrtory”"
            step 2, system, "exibe tela de extração por diretório"
            step 3, administrador, "seleciona pasta “Ext1”, que contém um único conjunto de arquivos para a família “IPP320-01T1220A”, e pressiona o botão “Extract”"
            step 4, system, "exibe na parte inferior da tela uma mensagem indicando que uma extração foi realizada"
            step 5, administrador, "acessa página “Extractions”"
            step 6, system, "exibe a lista de extrações com somente um elemento"
            step 7, administrador, "faz logout"
            step 8, system, "exibe página de login"
            step 9, administrador, "faz login como operador e vai para a página “Extractions”"
            step 10, system, "exibe uma lista vazia"
            step 11, administrador, "pressiona opção “Extract from dicrtory”"
            step 12, system, "exibe tela de extração por diretório"
            step 13, administrador, "seleciona pasta “Ext1”, que contém um único conjunto de arquivos para a família “IPP320-01T1220A”, e pressiona o botão “Extract”"
            step 14, system, "exibe na parte inferior da tela uma mensagem indicando que uma extração foi realizada"
            step 15, administrador, "acessa página “Extractions”"
            step 16, system, "exibe a lista de extrações com somente um elemento"
            step 17, administrador, "faz logout"
            step 18, system, "exibe página de login"
            step 19, administrador, "faz login como administrador e vai para a página “Extractions”"
            step 10, system, "exibe uma lista com duas entradas"
        }

        postCondition " "
    }
}