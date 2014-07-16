# Method allows you to make element appear, if it is hidden and might be visible
# only when cursor is over a place/area which triggers action to show it.
# It is not allowed to operate with hidden elements, this method makes the visible.
# Example: @project.some_page.some_element.hover
module Capybara
  module Node
    class Element
      def hover
        @session.driver.browser.action.move_to(self.native).perform
      end
    end
  end
end