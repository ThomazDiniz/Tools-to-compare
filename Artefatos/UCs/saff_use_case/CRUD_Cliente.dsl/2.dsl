system "SAFF", {
    usecase "CRUD Cliente", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"
        version "1.1", type:"Update", user:"Larissa", date:"01/02/2016"

        actor superAdmin, "Super administrador"

        preCondition "Estar logado como super administrador" 

        basicFlow {
            step 1, superAdmin, "seleciona opção 'Customers' no menu Settings"
            step 2, system, "exibe lista de clientes"
            step 3, superAdmin, "seleciona o botão 'Create Customer'"
            step 4, system, "exibe página com campos de cadastro de novo cliente"
            step 5, superAdmin, "preenche corretamente os campos 'Name', 'Key File' e 'Country' e pressiona o botão 'Create' ", af:[1]
            step 6, system, "exibe página com dados do novo cliente e mensagem que um novo cliente foi adicionado"
            step 7, superAdmin, "seleciona opção 'Customers' no menu Settings"
            step 8, system, "exibe lista de clientes"
            step 9, superAdmin, "clica no nome de um cliente"
            step 10, system, "exibe dados do cliente"
            step 11, superAdmin, "clica no botão 'Cancel'", af:[2,3]
            step 12, system, "retorna a lista de clientes"
        }

        alternative 1, "Cancela criação", {
            step 1, superAdmin, "Cancela criação", bfs:2
        }    

        alternative 2, "Edita dados", {
            step 1, superAdmin, "clica no botão 'Edit'"
            step 2, system, "exibe campos do cliente com valores atuais que podem ser editados"
            step 3, superAdmin, "preenche os novos valores e pressiona o botão 'Update", bfs:10
        }

        alternative 3, "Deleta cliente", {
            step 1, superAdmin, "clica no botão 'Delete'"
            step 2, system, "exibe mensagem solicitando confirmação"
            step 3, superAdmin, "pressiona o botão OK", bfs:2
        }     

        postCondition " "
    }
}