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

# TODO: move configuration parts into separate config file
# Capabilities for Sauce Labs service
def sauce_capabilities
  {
      :username => Helpers::Config['sauce_user'],
      :accessKey => Helpers::Config['sauce_akey'],
      :screenResolution => '1280x1024',
      :platform => 'OS X 10.6',
      :browserName => 'chrome',
      :browserVersion => '35',
      :jobName => 'New job'
  }
end

# Registers driver for iPhone browser
#TODO: support of iPhone browser by using either http://appium.io/ or http://ios-driver.github.io/ios-driver/

# Defines Sauce Labs Grid\HUB URL with the credentials from config.yml
def sauce_url
  'http://'+Helpers::Config['sauce_user']+':'+Helpers::Config['sauce_akey']+'@ondemand.saucelabs.com:80/wd/hub'
end

World(Capybara)
World(Laces)
