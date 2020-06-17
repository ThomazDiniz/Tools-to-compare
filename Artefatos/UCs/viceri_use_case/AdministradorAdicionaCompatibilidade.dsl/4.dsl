system "Bazooca",{

    usecase "Administrador Adiciona Compatibilidade", {

        version "1.0", type:"Criacao", user:"SPLab", date:"07/02/2017"

        actor Administrador, "Usuario Administrador"
        actor system, "Bazooca"

        preCondition "Usuario Administrador esta logado no sistema."

        basicFlow {
            step 1, Administrador,  "Clicar na opcao 'Compatibilidade' no menu da tela principal"
            step 2, system,         "exibe a tela de listagem das Compatibilidades"
            step 3, Administrador,  "clica em 'Adicionar Compatibilidade'"
            step 4, system,         "exibe a tela de cadastro de Compatibilidade"
            step 5, Administrador,  "preenche os dados da Compatibilidade e clica em botao 'Registrar'"
            step 6, system,         "notifica usuario que os nova Compatibilidade foi adicionada com sucesso", ef:[1,2,3]
        }

        exception 1, "Nao insere algum dado obrigatorio'", { 
            step 1, system,         "informa que os dados obrigatorios devem ser preenchidos"
            step 2, Administrador,  "preenche dados obrigatorios e clica em Atualizar", bfs:6
        }

        exception 2, "Usuario insere Tipo de Mercadoria invalido", {
            step 1, system,         "alerta que Tipo de Mercadoria e invalido"
            step 2, Administrador,  "preenche um Tipo de Mercadoria valido e clica em Atualizar", bfs:6  
        }

        exception 3, "Usuario insere NCM invalido", {
            step 1, system, "alerta que NCM e invalido"
            step 2, Administrador,  "preenche um NCM valido e clica em Atualizar", bfs:6
        }

        postCondition "A nova Compatibilidade esta adicionada ao banco."
    } 
}
