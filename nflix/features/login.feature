@execLogin
Feature: Login

             Para que eu possa gerenciar os filmes do catálogo Ninjaflix
             Sendo um usuário previamente cadastrado
             Posso acessar os sistema com o meu email e senha 

        @login_happy
        Scenario: Acesso
             When eu faço login com "tony@stark.com" e "pwd123"
             Then devo ser autenticado
              And devo ver "Tony Stark" na área logada
        @login_haplass
        Scenario Outline: Login sem sucesso
             When eu faço login com <email> e <senha>
             Then não devo ser autenticado
              And devo ver a mensgam de alerta <texto>

        Examples:
                  | email             | senha    | texto                          |
                  | "tony@stark.com"  | "abc123" | "Usuário e/ou senha inválidos" |
                  | "404@yahoo.com"   | "abc123" | "Usuário e/ou senha inválidos" |
                  | ""                | "abc123" | "Opps. Cadê o email?"          |
                  | "teste@gamil.com" | ""       | "Opps. Cadê a senha?"          |


     #    Scenario: Senha invalida
     #         When eu faço login com "tony@stark.com" e "abc123"
     #         Then não devo ser autenticado
     #          And devo ver a mensagem de alerta "Usuário e/ou senha inválidos"

     #    Scenario: Usuário não existe
     #         When eu faço login com "404@yahoo.com" e "404@yahoo.com"
     #         Then não devo ser autenticado
     #          And devo ver a mensagem de alerta "Usuário e/ou senha inválidos"

     #    Scenario: Email não informado
     #         When eu faço login com "" e "abcxpto"
     #         Then não devo ser autenticado
     #          And devo ver a mensagem "Opps. Cadê o email?"

     #    Scenario: Senha náo informada
     #         When eu faço longin com "teste@gamil.com" e ""
     #         Then não devo autenticado
     #          And devo ver a mensagem de alerta "Opps. Cadê a senha?"

        

    
