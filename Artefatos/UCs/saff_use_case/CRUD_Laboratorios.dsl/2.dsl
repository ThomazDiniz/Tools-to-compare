system "SAFF", {
    usecase "CRUD Laboratorios", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor superAdmin, "Super administrador"

        preCondition "Estar logado como super administrador" 

        basicFlow {
            step 1, superAdmin, "seleciona opção 'Laboratories' no menu Settings"
            step 2, system, "exibe lista de laboratórios"
            step 3, superAdmin, "seleciona o botão 'Create Laboratories'"
            step 4, system, "exibe página com campos de cadastro de novo Laboratório"
            step 5, superAdmin, "preenche corretamente os campos 'Name', 'Country' e 'Description' e pressiona o botão 'Create' ", af:[1,2,4]
            step 6, system, "exibe página com dados do novo Laboratório e mensagem que um novo entrada foi adicionado"
            step 7, superAdmin, "seleciona opção 'Laboratories' no menu Settings"
            step 8, system, "exibe lista de laboratórios"
            step 9, superAdmin, "clica no nome de um Laboratório"
            step 10, system, "exibe dados do Laboratório e lista de usuários associados a este"
            step 11, superAdmin, "clica no botão 'Cancel'", af:[3]
            step 12, system, "retorna a lista de laboratórios"
        }

        alternative 1, "Campo fora da formatação esperada, e.g, Country = xx", {
            step 1, superAdmin, "preenche incorretamente algum dos campos 'Name', 'Country' ou 'Description' e pressiona o botão 'Create' "
            step 2, system, "exibe mensagem informando que os dados não correspondem a formatação esperada", bfs:5
        }   

        alternative 2, "Cancela criação", {
            step 1, superAdmin, "cancela criação", bfs:2
        }    

        alternative 3, "Edita dados", {
            step 1, superAdmin, "clica no botão 'Edit'"
            step 2, system, "exibe campos do Laboratório com valores atuais que podem ser editados"
            step 3, superAdmin, "preenche os novos valores e pressiona o botão 'Update", bfs:2
        }

        alternative 4, "Nome de Laboratório já existente", {
            step 1, superAdmin, "preenche o campo 'Name' com um nome de laboratório jã existente. Preenche corretamente os campos 'Country' e 'Description' e pressiona o botão 'Create' "
            step 2, system, "exibe mensagem informando que já existe laboratório cadastrado com esse nome", bfs:5
        }       

        postCondition " "
    }
}