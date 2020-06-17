 system "SAFF Extractor", {
    usecase "Login no extrator como Administrador", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"
        version "2.0", type:"Modification", user:"Everton", date:"24/07/2015"
        version "2.1", type:"Modification", user:"Larissa", date:"28/07/2015"

        actor administrador, "Super Administrador"

        preCondition "Deve existir um usuario cadastrado com perfil administrador"

        basicFlow {
            step 1, administrador, "abre modulo de extracao"
            step 2, system, "exibe tela de login"
            step 3, administrador, "digita o user e a password de um usuário administrador e pressiona o botao Login", af:[1,2,3]
            step 4, system, "exibe tela de extracao por dispositivo", ef:[1,2,3]
        }

        alternative 1, "User invalido", {
            step 1, administrador, "digita o user de um usuário inválido, digita uma password e pressiona o botao Login"
            step 2, system, "exibe mensagem “Invalid user or password” na tela de login", bfs:2
        }

        alternative 2, "Password invalida", {
            step 1, administrador, "digita o user de um usuário administrador corretamente, digita uma password invalida e pressiona o botao Login"
            step 2, system, "abre um pop-up e exibe a mensagem “User or Password incorrect. Attempts remaining until the account lockout: #tentativas restantes#” em um pop-up"
            step 3, administrador, "pressiona o botao Ok"
            step 4, system, "fecha a janela pop-up", bfs:2
        }

        alternative 3, "Numero de tentativas invalidas e 5", {
            step 1, administrador, "digita o user de um usuario administrador corretamente, digita uma password invalida pela sexta vez e pressiona o botao Login"
            step 2, system, "bloqueia o usuário e exibe a mensagem 'This user has been blocked'"
            step 3, administrador, "tenta mais uma vez logar na conta do usuário, agora com dados validos"
            step 4, system, "exibe mensagem informando usuario está bloqueado"
        }

        exception 1, "Sem conexao com o servidor e usuario deseja fazer extracao offline", {
            step 1, system, "exibe pop-up questionando se o usuqrio deseja fazer extracoes offline"
            step 2, administrador, "pressiona o botao Yes"
            step 3, system, "fecha a janela pop-up e exibe tela de extracao por dispositivo em modo offline"
        }

        exception 2, "Sem conexao com o servidor e usuário nao deseja fazer extração offline", {
            step 1, system, "exibe pop-up questionando se o usuário deveja fazer extracoes offline"
            step 2, administrador, "pressiona o botao No"
            step 3, system, "fecha a janela pop-up", bfs:3
        }

        exception 3, "Usuario inativo por 90 dias", {
            step 1, system, "exibe a mensagem 'This user has been blocked'"
            step 2, administrador, "executa programa externo que reinicia senha de super admin", bfs:3
        }

        postCondition "O usuario deve estar logado"
    }
}