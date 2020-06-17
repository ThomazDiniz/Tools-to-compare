system "SAFF", {
    usecase "Visualizar e editando propria conta", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor operador, "Operador do sistema"

        preCondition "Usuario deve estar logado no servidor"

        basicFlow {
            step 1, operador, "seleciona a opcao 'My Account'"
            step 2, system, "exibe tela onde os campos 'Name', 'Login', 'Type', 'Laboratory' e 'Language'. Eles estão devidamente preenchidos"
            step 3, operador, "pressiona botao 'Edit'"
            step 4, system, "exibe pagina com campos em branco para atualizacao"
            step 5, operador, "preenche corretamente os campos 'Old Password', 'New Password', 'Confirm Password' e pressiona o botao 'Update'", af:[1,2,3,4]
            step 6, system, "exibe pagina com informacoes do usuario e apresenta mensagem informando que as informacoes foram atualizadas"

        }

        alternative 1, "Troca Idioma", {
            step 1, operador, "preenche corretamente os campos 'Old Password', 'New Password', 'Confirm Password', troca 'Language' de Ingles para Portugues e pressiona o botao 'Update'"
            step 2, system, "exibe pagina com informações do usuario. Apresenta mensagem informando que as informacoes foram atualizadas e atualiza conta no novo idioma"
        }        

        alternative 2, "Cancela Edicao", {
            step 1, operador, "pressiona botao 'Cancel'", bfs:2
        }

        alternative 3, "Password invalido", { 
            step 1, operador, "preenche incorretamente o campos 'Old Password'"
            step 2, system, "exibe mensagem infrmando que o Password fornecido não esta correto", bfs:5
        }

        alternative 4, "Novo Password fora dos padroes (uppercase, lowercase, numbers, special characters and size between 8 and 20)", {
            step 1, operador, "preenche o campos 'New Password' com uma senha fora dos padroes exigidos"
            step 2, system, "exibe mensagem infrmando que o Password fornecido nao esta conforme o exigido", bfs:5
        }

        postCondition " "
    }
}