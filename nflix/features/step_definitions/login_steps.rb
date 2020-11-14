When('eu faço login com {string} e {string}') do |email, senha|
    @login_page.go
    @login_page.logar_com(email, senha)
end
  
  Then('devo ser autenticado') do
    expect(get_token.length).to be 147
  end
  
  Then('devo ver {string} na área logada') do |expect_name|
    expect(@sidebar.usuario_logado).to eql expect_name
  end

  Then('não devo ser autenticado') do
    expect(get_token).to be nil
  end
  
  Then('devo ver a mensgam de alerta {string}') do |msg|
    expect(@login_page.alerta).to eql msg
  end