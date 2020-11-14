class LoginPage 
    include Capybara::DSL
    def go 
        visit '/'
    end

    def logar_com(email, senha) 
        find('#emailId').set email
        find('#passId').set senha
        find('button[class^=btn]').click
        #click_button 'Entrar' 
    end

    def alerta 
        find('.card-body .alert span').text
    end
end