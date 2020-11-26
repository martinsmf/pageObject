require 'report_builder'
require 'date'

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
# pega a data e hora atual
date = DateTime.now
@current_date = date.to_s.tr(':', '-') 
at_exit do
    ReportBuilder.configure do |config|
        config.input_path = 'log/report.json'
        config.report_path = 'log/report' + @current_date
        config.report_types = [:html]
        config.compress_imag = true
        config.report_title = 'Ninjaflix - webApp'
        config.additional_info = {'App' => 'Web', 'Data de execução' => @current_date}
        config.color = 'indigo'
    end
    ReportBuilder.build_report
end 