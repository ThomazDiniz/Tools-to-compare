system "SAFF", {
    usecase "CRUD Secoes", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor superAdmin, "Super administrador"

        preCondition "Estar logado como super administrador" 

        basicFlow {
            step 1, superAdmin, "seleciona opção 'Sections' no menu Settings"
            step 2, system, "exibe lista de Seções"
            step 9, superAdmin, "clica no nome de uma seção"
            step 10, system, "exibe dados da seção"
            step 11, superAdmin, "clica no botão 'Cancel'", af:[1]
            step 12, system, "retorna a lista de seções"
        }

        alternative 1, "Edita dados", {
            step 1, superAdmin, "clica no botão 'Edit'"
            step 2, system, "lista as opções possíveis de serem incluídas na seção"
            step 3, superAdmin, "escolhe as opções e pressiona o botão 'Update"
            step 4, system, "exibe mensagem informando que a seção foi atualizada", bfs:1
        }  

        postCondition " "
    }
}