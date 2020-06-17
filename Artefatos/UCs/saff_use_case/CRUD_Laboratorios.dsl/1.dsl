system "SAFF", {
    usecase "CRUD Laboratorios", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor superAdmin, "Super administrador"

        preCondition "Estar logado como super administrador" 

        basicFlow {
            step 1, superAdmin, "seleciona opcao 'Laboratories' no menu Settings"
            step 2, system, "exibe lista de laboratórios"
            step 3, superAdmin, "seleciona o botao 'Create Laboratories'"
            step 4, system, "exibe página com campos de cadastro de novo Laboratório"
            step 5, superAdmin, "preenche corretamente os campos 'Name', 'Country' e 'Description' e pressiona o botão 'Create' ", af:[1,2,4]
            step 6, system, "exibe pagina com dados do novo Laboratório e mensagem que um novo entrada foi adicionado"
            step 7, superAdmin, "seleciona opcao 'Laboratories' no menu Settings"
            step 8, system, "exibe lista de laboratorios"
            step 9, superAdmin, "clica no nome de um Laboratório"
            step 10, system, "exibe dados do Laboratorio e lista de usuarios associados a este"
            step 11, superAdmin, "clica no botão 'Cancel'", af:[3]
            step 12, system, "retorna a lista de laboratorios"
        }

        alternative 1, "Campo fora da formatacao esperada, e.g, Country = xx", {
            step 1, superAdmin, "preenche incorretamente algum dos campos 'Name', 'Country' ou 'Description' e pressiona o botão 'Create' "
            step 2, system, "exibe mensagem informando que os dados nao correspondem a formatação esperada", bfs:5
        }   

        alternative 2, "Cancela criacao", {
            step 1, superAdmin, "cancela criacao", bfs:2
        }    

        alternative 3, "Edita dados", {
            step 1, superAdmin, "clica no botao 'Edit'"
            step 2, system, "exibe campos do Laboratório com valores atuais que podem ser editados"
            step 3, superAdmin, "preenche os novos valores e pressiona o botao 'Update", bfs:2
        }

        alternative 4, "Nome de Laboratorio já existente", {
            step 1, superAdmin, "preenche o campo 'Name' com um nome de laboratorio ja existente. Preenche corretamente os campos 'Country' e 'Description' e pressiona o botao 'Create' "
            step 2, system, "exibe mensagem informando que ja existe laboratório cadastrado com esse nome", bfs:5
        }       

        postCondition " "
    }
}