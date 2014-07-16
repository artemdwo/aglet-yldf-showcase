class Helpers::Browser
  def self.resize_window
    Capybara.current_session.driver.browser.manage.window.resize_to(430, 600)
  end

  def self.full_size_window
    Capybara.current_session.driver.browser.manage.window.resize_to(1300, 900)
  end

  def self.delete_cookies
    Capybara.current_session.driver.browser.manage.delete_all_cookies
  end

  def self.pop_up_window
    Capybara.current_session.driver.browser.window_handles.length.should == 1
  end

  def close_pop_up
    Capybara.current_session.driver.browser.switch_to.alert.accept
  end

  def self.maximise_window
    Capybara.current_session.driver.browser.manage.window.maximize
  end
end

