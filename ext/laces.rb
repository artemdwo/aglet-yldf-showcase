module Laces
  # To perform waiting process for background request/response updates
  def wait_for_ajax
    sleep 0.3
    Timeout.timeout(ajax_timeout) {sleep(0.1) until page.evaluate_script("jQuery.active") == 0 }
    sleep 0.3
  end

  # Method creates screenshot of browser window and puts
  # it ../tmp/screens/%d-%m-%Y_%H:%M.png
  # To use on-demand in critical places with 'recover'
  def make_screenshot_here
    data_time = Time.now.strftime('%d-%m-%Y_%H:%M')
    puts "Saving screenshot #{data_time}.png ..."
    page.save_screenshot('tmp/screens/' + data_time + '.png')
  end

  # Method passes _ajax_timeout_ value from config.yml to all tests
  def ajax_timeout
    (Helpers::Config['ajax_timeout']).to_i
  end

  # Method passes _front_timeout_ value from config.yml to all tests
  def front_timeout
    (Helpers::Config['front_timeout']).to_i
  end

  # Method passes _back_timeout_ value from config.yml to all tests
  def back_timeout
    (Helpers::Config['back_timeout']).to_i
  end

  # Method does scroll to the TOP of the page
  def scroll_to_top
    page.execute_script 'window.scrollBy(0,-10000)'
  end

  # Method does SMALL scroll UP of the page
  def scroll_up_a_bit
    page.execute_script 'window.scrollBy(0,-700)'
  end

  # Method does SMALL scroll DOWN of the page
  def scroll_down_a_bit
    page.execute_script 'window.scrollBy(0,700)'
  end

  # Method does scroll to the BOTTOM of the page
  def scroll_to_bottom
    page.execute_script 'window.scrollBy(0,10000)'
  end
end