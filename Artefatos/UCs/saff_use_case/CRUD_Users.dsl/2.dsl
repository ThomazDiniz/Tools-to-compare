system "SAFF", {
    usecase "CRUD Users", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor usuário, "Super administrador"

        preCondition "Deve existir pelo menos um usuário super administrador" 

        basicFlow {
            step 1, usuário, "loga no sistema com perfil de super administrador"
            step 2, system, "exibe tela principal"
            step 3, usuário, "seleciona opcao 'Users' no menu Settings"
            step 4, system, "exibe lista completa de usuários"
            step 5, usuário, "seleciona o botão 'Create User'"
            step 6, system, "exibe pagina com campos de cadastro do usuario"
            step 7, usuário, "preenche corretamente os campos 'Name', 'Login', 'Password', 'Confirm Password', escolhe uma opcao para os campos 'Type', 'Laboratory', 'Language', e pressiona o botão 'Create' ", af:[1,2]
            step 8, system, "exibe mensagem indicando que novo usuario foi criado"
            step 9, usuário, "clica no link de visualizacao dos usuarios"
            step 10, system, "exibe lista completa de usuarios"
            step 13, usuário, "clica no nome do novo usuário"
            step 14, system, "exibe dados do usuario"
            step 15, usuário, "clica no botão 'Cancel'", af:[3]
            step 16, system, "exibe lista completa de usuarios"
        } 

        alternative 1, "Usuário com login repetido", {
            step 1, usuário, "preenche o campo 'Login' com o login associado a um outro usuario cadastrado. Preenche corretamente os demais campos e pressiona o botão 'Create'"
            step 2, system, "exibe mensagem informando que os este usuarios já existe", bfs:7
        }   

        alternative 2, "Cancela criacao", {
            step 1, usuário, "cancela criacao", bfs:4
        }    

        alternative 3, "Edita dados", {
            step 1, usuário, "clica no botao 'Edit'"
            step 2, system, "exibe campos do documento com valores atuais que podem ser editados"
            step 3, usuário, "preenche os novos valores para os campos 'Name' e 'Type', mantém a linguagem e pressiona o botao 'Update", af:[4,5,6]
            step 4, system, "exibe novos dados do usuarios"
            step 5, usuário, "acessa link que lista todos usuarios", bfs:4
        }

        alternative 4, "Edita dados e altera linguagem", {
            step 1, usuário, "preenche os novos valores para os campos 'Name', 'Type', troca mantém o valor do campo 'Language' e pressiona o botão 'Update"
            step 2, system, "exibe novos dados do usuarios"
            step 3, usuário, "faz log out e se loga na conta do usuário que teve os dados atualizados"
            step 4, system, "e apresentado na nova linguagem"
        }

        alternative 5, "Reseta senha", {
            step 1, usuário, "pressiona botao 'Reset Password'"
            step 2, system, "exibe mensagem pedindo confirmacao"
            step 3, usuário, "confirma desejo de resetar senha", af:[7]
            step 4, system, "exibe lista completa de usuarios", bfs:5
        }

        alternative 6, "Bloqueio de usuario", {
            step 1, usuário, "pressiona botao 'Block User'"
            step 2, system, "exibe mensagem pedindo confirmacao"
            step 3, usuário, "confirma desejo de bloquear usuario", af:[8]
            step 4, system, "exibe mensagem confirmando bloqueio de usuario"
            step 5, usuário, "acessa link que lista todos usuarios"
            step 6, system, "exibe lista completa de usuários onde o usuario atualizado e sinalizado como bloqueado"
            step 7, usuário, "clica no nome do usuario bloqueado", af:[9]
            step 8, system, "exibe dados do usuario"
            step 9, usuário, "clica no botao 'Edit'", af:[10]
            step 10, system, "exibe campos do documento com valores atuais que podem ser editados"
            step 11, usuário, "pressiona botao 'Unblock User'"
            step 12, system, "exibe mensagem pedindo confirmação"
            step 13, usuário, "confirma desejo de desbloquear usuario"
            step 14, system, "exibe mensagem confirmando desbloqueio de usuario"
            step 15, usuário, "acessa link que lista todos usuarios"
            step 16, system, "exibe lista completa de usuários onde o usuario atualizado nao e sinalizado como bloqueado", bfs:5
        }  

        alternative 7, "Cancela reset de senha", {
            step 1, usuário, "cancela reset de senha"
        }   

        alternative 8, "Cancela bloqueio de usuario", {
            step 1, usuário, "cancela bloqueio", bfs:6
        }   

        alternative 9, "Test de bloqueio", {
            step 1, usuário, "faz log out e tenta loga na conta do usuario que teve os dados atualizados"
            step 2, system, "exibe mensagem que usuário esta bloqueado"
        }

        alternative 10, "Deleta usuario", {
            step 1, usuário, "clica no botão 'Delete'"
            step 2, system, "exibe mensagem solicitando confirmacao"
            step 3, usuário, "pressiona o botao OK", bfs:4
        }  
        
        postCondition " "
    }
}