require File.dirname(__FILE__) + '/./env'

Before do
  Helpers::Browser.maximise_window
  Capybara.reset_sessions!
end

After do
  page.driver.browser.quit
  Capybara.send(:session_pool).delete_if { |key, value| key =~ /selenium/i }
end
