require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'os'

require_relative 'helpers'

# informa que todos os metodos do modulo Helpres são nativo dentro da execução do cucumber
World(Helpers)

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = 'http://192.168.99.100:8080' # docker toolbox no windows
    #cinfig.app_host = 'http:/localhost:8080' # doker no mac ou linux
    config.default_max_wait_time = 15
end