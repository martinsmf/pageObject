Before do 
    @login_page = LoginPage.new
    @movie_page = MoviePage.new
    @sidebar = SideBarView.new

    # maximiza a tela
    # page.driver.browser.manage.window.maximize

    #  define o tamanho que vc deseja deixar a janela de acordo com a rezolução minima do projeto
    page.current_window.resize_to(1440, 900)
end

Before("@login") do
    user = CONFIG['users']['cat_manager']
    @login_page.go
    @login_page.logar_com(user['email'], user['pass'])
end

# if quando desejar que gere a evidencia apenas quando o cenario falhar. 
After  do #|scenario|
    # if scenario.failed?
        temp_shot = page.save_screenshot('log/temp_shot.png')
        # converte o print em binário 
        screenshot = Base64.encode64(File.open(temp_shot, "rb").read)
        # anexa o print no relatório
        embed(screenshot, 'image/png', 'Screenshot')
    # end
end