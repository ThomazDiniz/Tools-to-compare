system "SAFF", {
    usecase "CRUD Secoes", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor superAdmin, "Super administrador"

        preCondition "Estar logado como super administrador" 

        basicFlow {
            step 1, superAdmin, "seleciona opcao 'Sections' no menu Settings"
            step 2, system, "exibe lista de Secoes"
            step 9, superAdmin, "clica no nome de uma secao"
            step 10, system, "exibe dados da secao"
            step 11, superAdmin, "clica no botao 'Cancel'", af:[1]
            step 12, system, "retorna a lista de secoes"
        }

        alternative 1, "Edita dados", {
            step 1, superAdmin, "clica no botão 'Edit'"
            step 2, system, "lista as opcoes possíveis de serem incluidas na secao"
            step 3, superAdmin, "escolhe as opcoes e pressiona o botão 'Update"
            step 4, system, "exibe mensagem informando que a secao foi atualizada", bfs:1
        }  

        postCondition " "
    }
}