system "SAFF Extractor", {
	usecase "Combinando extracoes com diferente perfis", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor superAdministrador, "Super Administrador"
        actor administrador, "Administrador"
        actor operator, "Operador de uma lab diferente do administrador"
        actor operatorDois, "Operador de mesmo lab do administrador"
        actor manager, "Gerente de uma lab diferente do administrador e operador"

        preCondition "Administrador deve estar logado", "não existem extrações cadastradas"

        basicFlow {
            step 1, administrador, "pressiona opção “Extract from directory”"
            step 2, system, "exibe tela de extração por diretório"
            step 3, administrador, "seleciona pasta “Ext1”, que contém um único conjunto de arquivos para a família “IPP320-01T1220A”, e pressiona o botão “Extract”"
            step 4, system, "exibe na parte inferior da tela uma mensagem indicando que uma extração foi realizada"
            step 5, administrador, "acessa página “Extractions”"
            step 6, system, "exibe a lista de extrações com somente um elemento"
            step 7, administrador, "faz logout"
            step 8, system, "exibe página de login"
            step 9, operator, "faz login e vai para a página “Extractions”"
            step 10, system, "exibe uma lista vazia"
            step 11, operator, "pressiona opção “Extract from directory”"
            step 12, system, "exibe tela de extração por diretório"
            step 13, operator, "seleciona pasta “Ext1”, que contém um único conjunto de arquivos para a família “IPP320-01T1220A”, e pressiona o botão “Extract”"
            step 14, system, "exibe na parte inferior da tela uma mensagem indicando que uma extração foi realizada"
            step 15, operator, "acessa página “Extractions”"
            step 16, system, "exibe a lista de extrações com somente um elemento"
            step 17, operator, "faz logout"
            step 18, system, "exibe página de login"
            step 19, operatorDois, "faz login e vai para a página “Extractions”"
            step 20, system, "exibe uma lista com uma extração"
            step 17, operatorDois, "faz logout"
            step 18, system, "exibe página de login"
            step 19, manager, "faz login e vai para a página “Extractions”"
            step 20, system, "exibe uma lista vazia"
            step 21, manager, "pressiona opção “Extract from directory”"
            step 22, system, "exibe tela de extração por diretório"
            step 23, manager, "seleciona pasta “Ext1”, que contém um único conjunto de arquivos para a família “IPP320-01T1220A”, e pressiona o botão “Extract”"
            step 24, system, "exibe na parte inferior da tela uma mensagem indicando que uma extração foi realizada"
            step 25, manager, "acessa página “Extractions”"
            step 26, system, "exibe a lista de extrações com somente um elemento"
            step 27, manager, "faz logout"
            step 28, system, "exibe página de login"
            step 29, superAdministrador, "faz login e vai para a página “Extractions”"
            step 30, system, "exibe lista com três extrações"
        }

        postCondition " "
    }
}