system "SAFF Extractor", {
    usecase "Login no servidor como Administrador", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"
        version "2.0", type:"Modification", user:"Everton", date:"24/07/2015"
        version "2.1", type:"Modification", user:"Larissa", date:"28/07/2015"

        actor administrador, "Administrador do sistema"
        
        preCondition "Deve existir um usuario cadastrado com perfil administrador"

        basicFlow {
            step 1, administrador, "acessa o sistema"
            step 2, system, "exibe pagina de login"
            step 3, administrador, "digita o user e a password de um usuario administrador e pressiona o botao Login", af:[1,2,3]
            step 4, system, "exibe pagina “Search extraction”", ef:[1,2]
        }

        alternative 1, "User invalido", {
            step 1, administrador, "digita o user de um usuário invalido, digita uma password e pressiona o botao Login"
            step 2, system, "exibe mensagem “Invalid user or password” na pagina de login", bfs:3
        }

        alternative 2, "Password invalida", {
            step 1, administrador, "digita o user de um usuario administrador corretamente, digita uma password inválida e pressiona o botão Login"
            step 2, system, "exibe mensagem “User or Password incorrect. Attempts remaining until the account lockout: #tentativas restantes#” na página de login", bfs:3
        }

        alternative 3, "Número de tentativas invalidas e 5", {
            step 1, administrador, "digita o user de um usuario administrador corretamente, digita uma password inválida pela sexta vez e pressiona o botao Login"
            step 2, system, "bloqueia o usuario"
            step 3, system, "exibe a mensagem “This user has been blocked.”"
        }

        exception 1, "Usuario inativo por 30 minutos", {
            step 1, system, "finaliza sessão do usuario e retorna a pagina de login ao receber alguma requisicao do usuario", bfs:2
        }

        exception 2, "Usuario inativo por 90 dias", {
            step 1, system, "exibe a mensagem “This user has been blocked.”"
        }

        postCondition "O usuario deve estar logado"
    }    
}