 system "SAFF Extractor", {
    usecase "Login no extrator como Administrador", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"
        version "2.0", type:"Modification", user:"Everton", date:"24/07/2015"

        actor administrador, "´Super Administrador"

        preCondition "Usuário deve estar logado no servidor como super administrador"

        basicFlow {
            step 1, administrador, "abre módulo de extração"
            step 2, system, "exibe página inicial do módulo de extração"
            step 3, administrador, "digita um login de usuário administrador e password e pressiona Login", af:[1,2,3]
            step 4, system, "exibe tela “SAFF Extractor”", ef:[1,2,3]
        }

        alternative 1, "Login ou Password inválidos", {
            step 1, administrador, "digita um login de usuário administrador e/ou password invalidos e pressiona Login"
            step 2, system, "exibe mensagem “Invalid username or password” na tela de login", bfs:3
        }

        alternative 2, "Numero de tentativas invalidas é 3", { 
            step 1, administrador, "digita um login de usuário administrador e/ou password invalidos pela terceira vez e pressiona Login"
            step 2, system, "exibe mensagem de alerta", bfs:3
        }

        alternative 3, "Numero de tentativas invalidas é 5", {
            step 1, administrador, "digita um login de usuário administrador e/ou password invalidos pela quinta vez e pressiona Login"
            step 2, system, "bloqueia usuário"
            step 3, administrador, "tenta mais uma vez logar na conta do usuário, agora com dados válidos"
            step 4, system, "exibe mensagem que usuário está bloqueado"
        }

        exception 1, "Sem conexão com o servidor e usuário deseja fazer extração offline", {
            step 1, system, "exibe pop-up questionanado se o usuário deveja fazer uma extração offline"
            step 2, administrador, "pressiona Yes"
            step 3, system, "fecha a janela pop-up"
            step 4, system, "exibe tela “SAFF Extractor” em modo offline"
        }

        exception 2, "Sem conexão com o servidor e usuário não deseja fazer extração offline", {
            step 1, system, "exibe pop-up questionanado se o usuário deveja fazer uma extração offline"
            step 2, administrador, "pressiona No"
            step 3, system, "fecha a janela pop-up", bfs:3
        }

        exception 3, "Usuario inativo por 90 dias", {
            step 1, system, "infoma que usuario esta bloqueado por inatividade"
            step 2, administrador, "executa programa externo que reinicia senha de super admin", bfs:3
        }

        postCondition " "
    }
}