system "SAFF", {
    usecase "Listar Usuarios", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor usuário, "Usuário do sistema"

        preCondition "Existem diversos usuários de diferentes perfis cadastrados no sistema" 

        basicFlow {
            step 1, usuário, "loga no sistema com perfil de super administrador", af:[1,2,3]
            step 2, system, "exibe tela principal"
            step 3, usuário, "selecionar o botâo 'Options', opção 'Users' na página principal"
            step 4, system, "exibe lista com todos os usuários cadastrados"
            step 5, usuário, "clica no nome de um usuário"
            step 6, system, "exibe página contendo os campos 'Name', 'Login', 'Type' e 'Language' devidamente preenchidos"

        }

        alternative 1, "Gerente", {
            step 1, usuário, "loga no sistema com perfil de gerente"
            step 2, system, "exibe tela principal"
            step 3, usuário, "selecionar o botâo 'Options', opção 'Users' na página principal"
            step 4, system, "exibe lista somente cos usuários cadastrados do tipo 'Operator' associados ao mesmo laboratório que o gerente", bfs:5
        }

        alternative 2, "administrador", {
            step 1, usuário, "loga no sistema com perfil de administrador"
            step 2, system, "exibe tela principal"
            step 3, usuário, "selecionar o botâo 'Options', opção 'Users' na página principal"
            step 4, system, "exibe lista somente cos usuários cadastrados do tipo 'Operator' e 'Manager' associados ao mesmo laboratório que o administrador", bfs:5
        }

        alternative 3, "Super viewer", {
            step 1, usuário, "loga no sistema com perfil de super viewer", bfs:2
        }

        postCondition " "
    }
}