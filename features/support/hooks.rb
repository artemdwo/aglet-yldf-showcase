require File.dirname(__FILE__) + '/./env'

Before do
  if browser_stack.include? Capybara.default_driver
    Helpers::Browser.maximise_window
    Capybara.reset_sessions!
  end
end

After do
  if browser_stack.include? Capybara.default_driver
    page.driver.browser.quit
    Capybara.send(:session_pool).delete_if { |key, value| key =~ /selenium/i }
  end
end

def browser_stack
  [:selenium_chrome, :selenium_firefox, :selenium_safari]
end