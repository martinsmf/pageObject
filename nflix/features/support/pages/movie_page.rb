class MoviePage
    include Capybara::DSL
    def add
        find('i[class$="nc-simple-add"]').click
    end

    # faz upload da capa
    def upload(file) 
        # no windows pode ser qeu a bara no padão linux não funcione
        cover_file = File.join(Dir.pwd, 'features/support/fixtures/cover/' + file)
        #Pode ser usado o código para resolver o problema da barra
        cover_file = cover_file.tr('/', '\\')if OS.windows?
        #deixa visivel para o capybara os elemetos que nao estão visiveis
        Capybara.ignore_hidden_elements = false
        attach_file("upcover", cover_file)
        #volta o capybara para o padra que é ignorar os elementos que não estão visiveis
        Capybara.ignore_hidden_elements = true
    end

    #preenche o elenco
    def add_cast(cast)
        actor = find('.input-new-tag')
        cast.each do |a| 
            actor.set a
            actor.send_keys :tab
        end
    end

    def alert
        find('.alert').text
    end

    def select_status(status)
        # Combobox customizado com lis
        find('input[placeholder="Status"]').click
        find('.el-select-dropdown__item', text: status).click
    end

    def create(movie)
        #preenche o titulo
        find('input[name=title]').set movie["title"]
        select_status(movie["status"]) unless movie["status"].empty?
        #preenche o ano        
        find('input[name=year]').set movie["year"]
        #preeche a data de estreia
        find('input[name=release_date]').set movie["release_date"]
        add_cast(movie["cast"])
        #preenche a sinopse
        find('textarea[name=overview]').set movie["overview"]
        upload(movie["cover"]) unless movie["cover"].empty?
        find('#create-movie').click
    end

    def movie_tr(movie)
        find('table tbody tr', text: movie['title'])
    end


end