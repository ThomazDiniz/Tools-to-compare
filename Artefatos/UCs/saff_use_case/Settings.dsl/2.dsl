system "SAFF Extractor", {
	usecase "Settings", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor administrador, "Administrador do sistema"

        preCondition "Usuário deve estar logado no servidor e extrator como administrador", "Sistema está configurado para inglês"

        basicFlow {
            step 1, administrador, "pressiona botão 'Settings'", af:[1]
            step 2, system, "exibe a janela de configurações"
            step 3, administrador, "seleciona a opção 'Português' no campo 'Language' e pressiona botão 'Save'", af:[2,3]
            step 4, system, "exibe tela inicial 'SAFF extraction' tualizada com todos os campos em português"
        }

        alternative 1, "Linguagem Espanhol", {
            step 1, administrador, "Abre arquivo de configurações e modifica propriedade linguagem para 'Español', salva e loga novamente no sistema" 
            step 2, system, "exibe tela inicial 'SAFF extraction' atualizada com todos os campos em espanhol"
        }

        alternative 2, "Visible Test Type", {
            step 1, administrador, "seleciona somente opção 'Pre test' no campo 'Visible Test Type' e pressiona botão 'Save'"
            step 2, system, "atualiza tela inicial 'SAFF extraction' exibindo somente 'Pre test' como opção de teste."
        }

        alternative 3, "Default Test Type", {
            step 1, administrador, "seleciona somente opção 'Pre test' no campo 'Default Test Type' e pressiona botão 'Save'"
            step 2, system, "atualiza tela inicial 'SAFF extraction' exibindo e tipo de teste 'Pre test' está marcado."
        }

        postCondition " "
    }
}