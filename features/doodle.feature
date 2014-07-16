@google @doodle
Feature: Google Doodle

  @search
  Scenario: Find the Jubilee Doodle on Google
    Given   I am on the home Google Doodle page
    When    I search for Jubilee
    Then    The first result should contain 'Queen's Jubilee' doodle
