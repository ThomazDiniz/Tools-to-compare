system "SAFF", {
    usecase "CRUD Secu Infos", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor superAdmin, "Super administrador"

        preCondition "Estar logado como super administrador" 

        basicFlow {
            step 1, superAdmin, "seleciona opção 'Secu Infos' no menu Settings"
            step 2, system, "exibe lista de Secu Infos"
            step 3, superAdmin, "seleciona o botão 'Create Secu Info', situado no lado direito inferior da tela"
            step 4, system, "exibe página com campos de cadastro de novo Secu Info"
            step 5, superAdmin, "preenche corretamente os campos 'Secu Info' e 'Sxx' e pressiona o botão 'Create' ", af:[1,2]
            step 6, system, "exibe página com dados do novo Secu Info e mensagem que um novo entrada foi adicionado"
            step 7, superAdmin, "seleciona opção 'Secu Info' no menu Settings"
            step 8, system, "exibe lista de Secu Infos"
            step 9, superAdmin, "clica no nome de uma Secu Info"
            step 10, system, "exibe dados da Secu Info"
            step 11, superAdmin, "clica no botão 'Cancel'", af:[3,4]
            step 12, system, "retorna a lista de Secu Infos"
        }

        alternative 1, "Campo fora da formatação esperada", {
            step 1, superAdmin, "preenche incorretamente os campos 'Secu Info' e/ou 'Sxx' e pressiona o botão 'Create' "
            step 2, system, "exibe mensagem informando que os dados não correspondem a formatação esperada", bfs:5
        }   

        alternative 2, "Cancela criação", {
            step 1, superAdmin, "Cancela criação", bfs:2
        }    

        alternative 3, "Edita dados", {
            step 1, superAdmin, "clica no botão 'Edit'"
            step 2, system, "exibe campos do Secu Info com valores atuais que podem ser editados"
            step 3, superAdmin, "preenche os novos valores e pressiona o botão 'Update", bfs:2
        }

        alternative 4, "Deleta Secu Info", {
            step 1, superAdmin, "clica no botão 'Delete'"
            step 2, system, "exibe mensagem solicitando confirmação"
            step 3, superAdmin, "pressiona o botao OK", bfs:2
        }     

        postCondition " "
    }
}