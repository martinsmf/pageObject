Given('que {string} é um novo filme') do |movie_code|
    #buscar o arquivo apartir da raiz 
    filmes = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/movies.yaml'))
    @movie = filmes[movie_code]
    Database.new.delet_movie(@movie['title'])
end

Given('este filme já existe no catálogo') do
    Database.new.insert_movie(@movie)
end
  
When('eu faço o cadastro desse filme') do
  @movie_page.add
  @movie_page.create(@movie)
end
  
Then('devo ver o novo filme na lista') do
    result = @movie_page.movie_tr(@movie)
    expect(result).to have_text @movie['title']
    expect(result).to have_text @movie['status']
end

Then('devo ver a notificação {string}') do |expect_alert|
  expect(@movie_page.alert).to eql expect_alert
end