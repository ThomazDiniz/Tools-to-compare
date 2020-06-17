system "SAFF", {
    usecase "CRUD Cliente", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor superAdmin, "Super administrador"

        preCondition "Estar logado como super administrador" 

        basicFlow {
            step 1, superAdmin, "seleciona opcao 'Customers' no menu Settings"
            step 2, system, "exibe lista de clientes"
            step 3, superAdmin, "seleciona o botão 'Create Customer'"
            step 4, system, "exibe pagina com campos de cadastro de novo cliente"
            step 5, superAdmin, "preenche corretamente os campos 'Name', 'Key File' e 'Country' e pressiona o botao 'Create' ", af:[1,2]
            step 6, system, "exibe pagina com dados do novo cliente e mensagem que um novo cliente foi adicionado"
            step 7, superAdmin, "seleciona opcao 'Customers' no menu Settings"
            step 8, system, "exibe lista de clientes"
            step 9, superAdmin, "clica no nome de um cliente"
            step 10, system, "exibe dados do cliente"
            step 11, superAdmin, "clica no botao 'Cancel'", af:[3,4]
            step 12, system, "retorna a lista de clientes"
        }

        alternative 1, "Campo fora da formatacao esperada, e.g., 'ddd' para 'Key File'", {
            step 1, superAdmin, "preenche incorretamente os campos 'Name', 'Key File' e/ou 'Country' e pressiona o botão 'Create' "
            step 2, system, "exibe mensagem informando que os dados nao correspondem a formatação esperada", bfs:5
        }   

        alternative 2, "Cancela criacao", {
            step 1, superAdmin, "Cancela criacao", bfs:2
        }    

        alternative 3, "Edita dados", {
            step 1, superAdmin, "clica no botao 'Edit'"
            step 2, system, "exibe campos do cliente com valores atuais que podem ser editados"
            step 3, superAdmin, "preenche os novos valores e pressiona o botao 'Update", bfs:2
        }

        alternative 4, "Deleta cliente", {
            step 1, superAdmin, "clica no botao 'Delete'"
            step 2, system, "exibe mensagem solicitando confirmacao"
            step 3, superAdmin, "pressiona o botao OK", bfs:2
        }     

        postCondition " "
    }
}