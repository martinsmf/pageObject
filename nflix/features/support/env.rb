require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'os'

require_relative 'helpers'

# informa que todos os metodos do modulo Helpres são nativo dentro da execução do cucumber
World(Helpers)

# Variavel para carregar variaeis de ambiente
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))

case ENV['BROWSER']
when 'chrome'
    @driver = :selenium_chrome
when 'headless'
    @driver = :selenium_chrome_headless
when 'firefox'
    @driver = :selenium
else
    puts 'Invalid Browser'
end

Capybara.configure do |config|
    config.default_driver = @driver
    config.app_host = CONFIG['url']
    config.default_max_wait_time = 15
end