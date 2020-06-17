system "SAFF Extractor", {
    usecase "Login no servidor como Administrador", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"
        version "2.0", type:"Modification", user:"Everton", date:"24/07/2015"

        actor administrador, "Administrador do sistema"
        actor clock, "temporizador"

        preCondition "Deve existir um usuário cadastrado com perfil administrador"

        basicFlow {
            step 1, administrador, "digita um login e pasword de usuário administrador e pressiona o botão Login", af:[1,2,3]
            step 2, system, "exibe tela “Search extraction”", ef:[1]
        }

        alternative 1, "Login ou Password inválidos", {
            step 1, administrador, "digita um login de usuário administrador e/ou password invalidos e pressiona Login"
            step 2, system, "exibe mensagem “Invalid username or password” na tela de login", bfs:1
        }

        alternative 2, "Número de tentativas inválidas é 3", {
            step 1, administrador, "digita um login de usuário administrador e/ou password invalidos pela terceira vez e pressiona Login"
            step 2, system, "exibe mensagem de alerta", bfs:1
        }

        alternative 3, "Número de tentativas inválidas é 5", {
            step 1, administrador, "digita um login de usuário administrador e/ou password invalidos pela quinta vez e pressiona Login"
            step 2, system, "bloqueia a sessão"
            step 3, administrador, "digita o login e pasword válidos do usuário bloqueado e pressiona o botão Login", af:[1,2,3]
            step 4, system, "informa que usuário está bloqueado"
        }

        exception 3, "Usuario inativo por 30 minutos", {
            step 1, system, "finaliza sessao do usuario e retorna a pagina de login", bfs:1
        }

        postCondition " "
    }

    
}