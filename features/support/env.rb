require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'cucumber'
require 'json'
require 'rspec'
require 'site_prism'
require 'selenium-webdriver'
require 'active_support/dependencies'
require 'time'
require 'active_support/time'
require 'tzinfo'

require './ext/capybara'
require './ext/laces'
require './ext/timer'
require 'capybara/iphone'
require 'capybara/user_agent'

# Sets the Timezone
Time.zone = 'Europe/London'

# Loads everything from the lib and config folders
ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.join(Dir.pwd, 'lib'))
ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.join(Dir.pwd, 'config'))

# Setup config for Browser
Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.run_server = false
  config.default_selector = :css
  config.default_wait_time = Helpers::Config['default_wait_time']
  config.ignore_hidden_elements = false
  config.visible_text_only = false
  config.match = :first
  config.exact_options = true
  config.javascript_driver = :selenium
end

# Registers driver for Chrome browser
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Registers driver for Firefox browser
Capybara.register_driver :selenium_firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

# Registers driver for Safari browser
Capybara.register_driver :selenium_safari do |app|
  Capybara::Selenium::Driver.new(app, :browser => :safari)
end

# Registers driver for iPhone browser
#TODO: support of iPhone browser by using either http://appium.io/ or http://ios-driver.github.io/ios-driver/

World(Capybara)
World(Laces)
