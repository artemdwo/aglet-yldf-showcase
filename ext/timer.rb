# What's that:
# Timer is to calculate how much time is needed to perform
# actions described in particular scenario.
#
# How to use:
# You can easily describe start\stop usage in 'features/step_definitions/'
# as regular steps like so:
# ... in 'features/step_definitions/counter_steps.rb'
#   And (/^I start timer$/) do
#     Timer.start
#   end
#
#   And (/^I stop timer$/) do
#     Timer.stop
#   end
#
# And use those steps in the 'features' like so:
# ... in 'features/counter.feature'
#   @counting
#   Feature: Count timings
#
#   @counting @any_tag_you_need
#   Scenario Outline: Some scenario with timer
#     Given   I start timer
#     And     Step#1
#     When    Step#2 with <params>
#     And     Step#3
#     Then    I stop timer
#   Examples:
#     |qty  |
#     | 1   |
#     | 5   |
#     | 10  |
# As a result you will have response after each example with time: 'Time spend: hh:mm:ss'

class Timer
  def self.start
    @start = Time.now
  end

  def self.stop
    puts "Time spend: #{Time.at(Time.now - @start).gmtime.strftime('%R:%S')}"
  end
end