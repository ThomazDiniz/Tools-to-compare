system "SAFF", {
    usecase "CRUD Documents", {
        version "1.0", type:"Creation", user:"Everton", date:"20/03/2015"

        actor usuário, "Usuário super administrador"

        preCondition "Deve existir pelo menos um Documento cadastrado" 

        basicFlow {
            step 1, usuário, "loga no sistema com perfil de super administrador ou administrador", af:[5]
            step 2, system, "exibe tela principal"
            step 3, usuário, "seleciona opção 'Documents' no menu Settings"
            step 4, system, "exibe lista completa de documentos"
            step 5, usuário, "seleciona o botao 'Create Document'"
            step 6, system, "exibe pagina com campos de cadastro de novo documento"
            step 7, usuário, "preenche corretamente os campos 'Title', 'Description', 'Family' (com uma família com extracoes existentes), seleciona um arquivo PDF e pressiona o botao 'Create' ", af:[1,2,6,7]
            step 8, system, "exibe lista de documentos"
            step 9, usuário, "clica no nome link de visualizacao do documento"
            step 10, system, "abre janela de visualização do pdf"
            step 11, usuário, "fecha janela"
            step 12, system, "retorna a lista de documentos"
            step 13, usuário, "clica no nome de um documento"
            step 14, system, "exibe dados do documento"
            step 15, usuário, "clica no botão 'Cancel'", af:[3,4]
            step 16, system, "retorna a lista de documentos"
            step 17, usuário, "abre lista de extracoes e seleciona uma das famílias cadastradas anteriormente"
            step 18, system, "se existir extracao da familia cadastrada, esta deve exibir no campo Document um link para o novo documento"
        }

        alternative 1, "Faltando arquivo", {
            step 1, usuário, "preenche corretamente os demais campos mas não seleciona um arquivo PDF. Pressiona o botao 'Create'"
            step 2, system, "exibe mensagem informando que os dados não correspondem a formatação esperada ou esta faltando informacoes", bfs:7
        } 

        alternative 6, "Documento com nome repetido", {
            step 1, usuário, "preenche o campo 'Title' com o nome de um documento ja cadastrado. Preenche corretamente os campos'Description', 'Family', seleciona um arquivo PDF e pressiona o botão 'Create'"
            step 2, system, "exibe mensagem informando que os já existe um documento cadastrado com o nome especificado", bfs:7
        }   

        alternative 7, "Upload de arquivo nao pdf", {
            step 1, usuário, "seleciona um arquivo de outro formato e pressiona o botao 'Create'"
            step 2, system, "exibe mensagem informando que o documento especificado nao e um arquivo PDF", bfs:7
        }   

        alternative 2, "Cancela criacao", {
            step 1, usuário, "cancela criacao", bfs:4
        }    

        alternative 3, "Edita dados", {
            step 1, usuário, "clica no botao 'Edit'"
            step 2, system, "exibe campos do documento com valores atuais que podem ser editados"
            step 3, usuário, "preenche os novos valores e pressiona o botão 'Update", bfs:4
        }

        alternative 4, "Deleta documento", {
            step 1, usuário, "clica no botao 'Delete'"
            step 2, system, "exibe mensagem solicitando confirmacao"
            step 3, usuário, "pressiona o botao OK", bfs:4
        }  

        alternative 5, "Visualizacao para Operador, Gerente", {
            step 1, usuário, "loga no sistema com perfil de administrador, gerente ou operador"
            step 2, system, "exibe tela principal"
            step 3, usuário, "seleciona opção 'Documents' no menu Settings"
            step 4, system, "exibe lista de documentos pertencentes ao mesmo laboratório do usuário"
            step 5, usuário, "clica no nome link de visualização do documento"
            step 6, system, "abre janela de visualização do pdf"
            step 7, usuário, "fecha janela"
            step 8, system, "retorna a lista de documentos"
            step 9, usuário, "clica no nome de um documento"
            step 10, system, "exibe dados do documento"
            step 11, usuário, "clica no botão 'Cancel'"
            step 12, system, "retorna a lista de documentos"
        }    
        
        postCondition " "
    }
}