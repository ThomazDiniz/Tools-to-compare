system "SAFF", {
    usecase "CRUD Diagnosticos", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor usuário, "Usuario"

        preCondition " " 

        basicFlow {
            step 1, usuário, "loga no sistema com perfil de super administrador ou administrador", af:[5]
            step 2, system, "exibe tela principal"
            step 3, usuário, "seleciona opçao 'Diagnostics' no menu Settings"
            step 4, system, "exibe lista diagnosticos"
            step 5, usuário, "seleciona o botao 'Create Diagnostic', situado no lado direito inferior da tela"
            step 6, system, "exibe página com campos de cadastro de novo documento"
            step 7, usuário, "preenche corretamente os campos 'Name', 'Family', 'Type', 'Scenary', 'Situation' e pressiona o botao 'Create' ", af:[6,1,2]
            step 8, system, "exibe lista de diagnósticos"
            step 9, usuário, "clica no nome de um diagnostico"
            step 10, system, "exibe dados do diagnóstico"
            step 11, usuário, "clica no botão 'Cancel'", af:[3,4]
            step 12, system, "retorna a lista de diagnosticos"
        }

        alternative 6, "Scenary ou Situation faltando informacao", {
            step 1, usuário, "preenche nao preenche algum dos campos 'Name', 'Family', 'Type', 'Scenary' ou 'Situation' e pressiona o botao 'Create' "
            step 2, system, "exibe mensagem informando que existe informaçao indispensável faltando", bfs:7
        }

        alternative 1, "Campo fora da formatação esperada", {
            step 1, usuário, "preenche algum dos campos ('Name', 'Family', 'Type', 'Scenary' ou 'Situation') com formatação errada e pressiona o botao 'Create' "
            step 2, system, "exibe mensagem informando que os dados nao correspondem a formatação esperada", bfs:7
        }   

        alternative 2, "Cancela criaçao", {
            step 1, usuário, "Cancela criaçao", bfs:4
        }    

        alternative 3, "Edita dados", {
            step 1, usuário, "clica no botao 'Edit'"
            step 2, system, "exibe campos do diagnostico com valores atuais que podem ser editados"
            step 3, usuário, "preenche os novos valores e pressiona o botão 'Update", bfs:4
        }

        alternative 4, "Deleta diagnostico", {
            step 1, usuário, "clica no botao 'Delete'"
            step 2, system, "exibe mensagem solicitando confirmaçao"
            step 3, usuário, "pressiona o botao OK", bfs:4
        }  

        alternative 5, "Visualizaçao para Operador, Gerente", {
            step 1, usuário, "loga no sistema com perfil de administrador, gerente ou operador"
            step 2, system, "exibe tela principal"
            step 3, usuário, "seleciona opçao 'Diagnostics' no menu Settings"
            step 4, system, "exibe lista de diagnosticos pertencentes ao mesmo laboratorio do usuario"
        }    
        
        postCondition " "
    }
}