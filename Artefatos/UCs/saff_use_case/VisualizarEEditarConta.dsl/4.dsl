system "SAFF", {
    usecase "Visualizar e editando propria conta", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor usuário, "Usuário do sistema"

        preCondition "Usuário deve estar logado no sistema", "administrador ou super administrador" 

        basicFlow {
            step 1, usuário, "seleciona a opção 'My Account' no canto superior direito"
            step 2, system, "exibe tela onde os campos 'Name', 'Login', 'Type' e 'Language'. Eles estão devidamente preenchidos"
            step 3, usuário, "pressiona botão 'Edit'"
            step 4, system, "exibe página com campos em branco para atualização"
            step 5, usuário, "preenche corretamente os campos 'Old Password', 'New Password', 'Confirm Password' e pressiona o botão 'Update'", af:[1,2,3,4]
            step 6, system, "exibe página com informações do usuário e apresenta mensagem informando que as informações foram atualizadas"

        }

        alternative 1, "Troca Idioma", {
            step 1, usuário, "preenche corretamente os campos 'Old Password', 'New Password', 'Confirm Password', troca 'Language' de Inglês para Português e pressiona o botão 'Update'"
            step 2, system, "exibe página com informações do usuário. Apresenta mensagem informando que as informações foram atualizadas e atualiza conta no novo idioma"
        }        

        alternative 2, "Cancela Edição", {
            step 1, usuário, "pressiona botão 'Cancel'", bfs:2
        }

        alternative 3, "Password inválido", { 
            step 1, usuário, "preenche incorretamente o campos 'Old Password'"
            step 2, system, "exibe mensagem infrmando que o Password fornecido não está correto", bfs:5
        }

        alternative 4, "Novo Password fora dos padrões (uppercase, lowercase, numbers, special characters and size between 8 and 20)", {
            step 1, usuário, "preenche o campos 'New Password' com uma senha fora dos padrões exigidos"
            step 2, system, "exibe mensagem infrmando que o Password fornecido não está conforme o exigido", bfs:5
        }

        postCondition " "
    }
}