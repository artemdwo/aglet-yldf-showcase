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

require "sauce"
require "sauce/capybara"
require "capybara/rspec"
require "sauce/cucumber"

# Sets the Timezone
Time.zone = 'Europe/London'

# Loads everything from the lib and config folders
ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.join(Dir.pwd, 'lib'))
ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.join(Dir.pwd, 'config'))

# Setup config for Browser
Capybara.configure do |config|
  if ENV['BROWSER'] != nil and Capybara.drivers.keys.include? ENV['BROWSER'].to_sym
    browser = ENV['BROWSER'].to_sym
  else
    browser = :selenium_chrome
  end
  config.default_driver = browser
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

# Registers driver for Sauce Labs remote hub
Capybara.register_driver :sauce do |app|
  Capybara::Selenium::Driver.new(app,
                                 :browser => :remote,
                                 :desired_capabilities => sauce_capabilities,
                                 :url => sauce_url
  )
end

# Capabilities for Sauce Labs service
def sauce_capabilities
  {
      :username => Helpers::Remote['sauce_config']['sauce_user'],
      :accessKey => Helpers::Remote['sauce_config']['sauce_akey'],
      :screenResolution => Helpers::Remote['sauce_config']['screenResolution'],
      :platform => Helpers::Remote['sauce_config']['platform'],
      :browserName => Helpers::Remote['sauce_config']['browserName'],
      :browserVersion => Helpers::Remote['sauce_config']['browserVersion'],
      :jobName => Helpers::Remote['sauce_config']['jobName']
  }
end

# Defines Sauce Labs Grid\HUB URL with the credentials from config.yml
def sauce_url
  'http://'+Helpers::Remote['sauce_config']['sauce_user']+':'+Helpers::Remote['sauce_config']['sauce_akey']+'@ondemand.saucelabs.com:80/wd/hub'
end

# Desktop - Registers driver for Browser Stack remote hub
Capybara.register_driver :browstack do |app|
  Capybara::Selenium::Driver.new(app,
                                 :browser => :remote,
                                 :desired_capabilities => browstack_capabilities,
                                 :url => browstack_url
  )
end

# Desktop - Capabilities for Browser Stack service
def browstack_capabilities
  {
      # Desktop Configuration
      :os => Helpers::Remote['browstack_config']['os'],
      :os_version => Helpers::Remote['browstack_config']['os_ver'],
      :browser => Helpers::Remote['browstack_config']['browser'],
      :browser_version =>  Helpers::Remote['browstack_config']['browser_ver'],
      :resolution => Helpers::Remote['browstack_config']['resolution'],
      :project => Helpers::Remote['browstack_config']['project'],
      :build => Helpers::Remote['browstack_config']['build'],
      :name => Helpers::Remote['browstack_config']['name'],
      :'browserstack.debug' => Helpers::Remote['browstack_config']['debug']
  }
end

# TODO: BrowserStack Driver for Mobile device
# Mobile Devices - Registers driver for Browser Stack remote hub
# Capybara.register_driver :browstack_mob do |app|
#   Capybara::Selenium::Driver.new(app,
#                                  :browser => :remote,
#                                  :desired_capabilities => browstack_mob_capabilities,
#                                  :url => browstack_url
#   )
# end
# TODO: BrowserStack Capabilities for Mobile device
# Mobile Devices - Capabilities for Browser Stack service
# def browstack_mob_capabilities
#   {
#       # Mobile Devices Configuration
#   }
# end

# Defines BrowserStack Grid\HUB URL with the credentials from config.yml
def browstack_url
  'http://'+Helpers::Remote['browstack_config']['browstack_user']+':'+Helpers::Remote['browstack_config']['browstack_akey']+'@hub.browserstack.com/wd/hub'
end

# Registers driver for Remote hub
Capybara.register_driver :hub do |app|
  Capybara::Selenium::Driver.new(app,
                                 :browser => :remote,
                                 :desired_capabilities => hub_capabilities,
                                 :url => Helpers::Remote['hub_config']['hub_url']
  )
end

# Capabilities for Grid service
def hub_capabilities
  {
      :platform => Helpers::Remote['hub_config']['platform'],
      :browserName => Helpers::Remote['hub_config']['browserName'],
      :version => Helpers::Remote['hub_config']['version']
  }
end

# Registers driver for iPhone browser
#TODO: support of iPhone browser by using either http://appium.io/ or http://ios-driver.github.io/ios-driver/

World(Capybara)
World(Laces)
