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
    @login_page.go
    @login_page.logar_com('tony@stark.com', 'pwd123')
end