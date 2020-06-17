system "SAFF Extractor", {
	usecase "Settings", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor administrador, "Administrador do sistema"

        preCondition "Usuario deve estar logado no servidor e extrator como administrador", "Sistema esta configurado para ingles"

        basicFlow {
            step 1, administrador, "pressiona botao 'Settings'", af:[1]
            step 2, system, "exibe a janela de configuracoes"
            step 3, administrador, "seleciona a opção 'Portugues' no campo 'Language' e salva", af:[2,3]
            step 4, system, "exibe tela inicial 'SAFF extraction' tualizada com todos os campos em portugues"
        }

        alternative 1, "Linguagem Espanhol", {
            step 1, administrador, "Abre arquivo de configuracoes e modifica propriedade linguagem para 'Espanol', salva e loga novamente no sistema" 
            step 2, system, "exibe tela inicial 'SAFF extraction' atualizada com todos os campos em espanhol"
        }

        alternative 2, "Visible Test Type", {
            step 1, administrador, "seleciona somente opcao 'Pre test' no campo 'Visible Test Type' e pressiona botao 'Save'"
            step 2, system, "atualiza tela inicial 'SAFF extraction' exibindo somente 'Pre test' como opcao de teste."
        }

        alternative 3, "Default Test Type", {
            step 1, administrador, "seleciona somente opcao 'Pre test' no campo 'Default Test Type' e pressiona botao 'Save'"
            step 2, system, "atualiza tela inicial 'SAFF extraction' exibindo e tipo de teste 'Pre test' esta marcado."
        }

        postCondition " "
    }
}