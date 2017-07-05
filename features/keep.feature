@google @keep
Feature: Google Keep

  Background: Login into Google Account
    Given I open Google Keep web app
    When  Enter login
    And   Enter password
    And   Submit login details

  Scenario: Google Keep web app is accessible
    Given I go to Google Keep web app
    Then  I am on Main Google Keep page

  Scenario: Create a Note
    Given I go to Google Keep web app
    When  I select Note form
    And   Fill in Title with Test Title
    And   Fill in Note content with Test Note Content
    Then  I save the Note
    And   Verify created Note with Title:Test Title and Content:Test Note Content

  Scenario: Create a Reminder
    Given I go to Google Keep web app
    When  I select Note form
    And   Fill in Title with Test Reminder Title
    And   Fill in Note content with Test Reminder Content
    And   Set reminder to Later Today
    Then  I save the Reminder
    And   Verify created Note with Title:Test Reminder Title and Content:Test Reminder Content
    And   Verify that date-time is Today, 8:00 PM

  Scenario: Archive a Note
    Given I go to Google Keep web app
    And   I find a Note with Title:Test Title and Content:Test Note Content
    When  I archive the Note
    Then  The Note with Title:Test Title and Content:Test Note Content should appear in Archive tab

  Scenario: Unarchive a Note
    Given I go to Google Keep web app
    And   I go to Archived tab
    And   I find a Note with Title:Test Title and Content:Test Note Content
    When  I unarchive the Note
    And   I go to Notes tab
    Then  Verify present Note with Title:Test Title and Content:Test Note Content

  Scenario: Delete a Note
    Given I go to Google Keep web app
    And   I find a Note with Title:Test Title and Content:Test Note Content
    When  I delete the Note
    Then  The Note with Title:Test Title and Content:Test Note Content should appear in Trash tab

  Scenario: Delete Forever a Note
    Given I go to Google Keep web app
    And   I go to Trash tab
    And   I find a Note with Title:Test Title and Content:Test Note Content
    When  I evaporate the Note
    Then  Empty Trash link should disappear

  @wip @not_implemented
  Scenario: Multi-select Notes delete and clean-up
    Given I go to Google Keep web app
    When  I select all available Notes
    And   I delete all the Note
    And   I go to Trash tab
    And   Empty the Trash
    Then  Empty Trash link should disappear

  @not_implemented
  Scenario: Search for Note by Title
    Given I go to Google Keep web app
    When  I create a Note with Title: Title1 and Content:Content1
    And   Type Title1 into Search field
    Then  One Note should be displayed on the page
    And   The Note should have Title:Title1

  @not_implemented
  Scenario: Search for Note by Content
    Given I go to Google Keep web app
    When  I create a Note with Title: Title2 and Content:Content2
    And   Type Content2 into Search field
    Then  One Note should be displayed on the page
    And   The Note should have Content:Content2

  @not_implemented
  Scenario: Notes tab contains only Notes
    Given I go to Google Keep web app
    When  I go to Notes tab
    Then  There should be no Notes with datetime set up

  @not_implemented
  Scenario: Reminders tab contains only Reminders
    Given I go to Google Keep web app
    When  I go to Reminders tab
    Then  There should be all Notes with datetime set up

  @not_implemented
  Scenario: Update a Reminder content
    Given I go to Google Keep web app
    When  I create a Reminder with Title:New Reminder Title and Content:New Reminder Content
    And   Set reminder to Later Today
    And   I find a Note with Title:New Reminder Title and Content:New Reminder Content
    And   Update Content to Updated Reminder Content
    And   Save Note changes
    Then  Verify present Note with Title:New Reminder Title and Content:Updated Reminder Content

  @not_implemented
  Scenario: Update a Reminder date-time
    Given I go to Google Keep web app
    When  I find a Note with Title:New Reminder Title and Content:Updated Reminder Content
    And   Set reminder to Tomorrow
    Then  Verify that date-time is Tomorrow, 8:00 PM

  @not_implemented
  Scenario: Delete a Reminder
    Given I go to Google Keep web app
    When  I find a Reminder with Title:New Reminder Title and Content:Updated Reminder Content
    And   I delete the Reminder
    Then  The Reminder with Title:New Reminder Title and Content:Updated Reminder Content should appear in Trash tab

  @not_implemented
  Scenario: Restore a Note
    Given I go to Google Keep web app
    When  I create a Note with Title:To Delete Title
    And   I find a Note with Title:To Delete Title
    And   I delete the Note
    And   I go to Trash tab
    And   I find a Note with Title:To Delete Title
    And   I restore the Note
    Then  The Reminder with Title:To Delete Title and Content:To Delete Conten should appear in Notes tab

  @not_implemented
  Scenario: Archive a Reminder
    Given I go to Google Keep web app
    And   I create a Random Reminder
    When  I archive the Random Reminder
    Then  The Random Reminder should appear in Archived tab

  @not_implemented
  Scenario: Unarchive a Reminder
    Given I go to Google Keep web app
    And   I go to Archived tab
    And   I search for Random Reminder
    When  I unarchive the Random Reminder
    Then  The Random Reminder should appear on Notes tab

  @not_implemented
  Scenario Outline: Set Note colour
    Given I go to Google Keep web app
    When  I create a Random Note
    And   I set <colour> colour
    And   I save the Note
    Then  Verify the Random Note background colour is set to <colour>

    Examples:
      |colour|
      |White |
      |Red   |
      |Orange|
      |Yellow|
      |Gray  |
      |Blue  |
      |Teal  |
      |Green |

  @not_implemented
  Scenario: Create a Note with labels
    Given I go to Google Keep web app
    When  I create a Random Note
    And   I set labels: new, note, test, random
    And   I save the Note
    Then  Verify the Random Note has "new, note, test, random" labels assigned

  @not_implemented
  Scenario: Create a Reminder with labels
    Given I go to Google Keep web app
    When  I create a Random Reminder
    And   I set labels: new, reminder, test, random
    And   I save the Reminder
    Then  Verify the Random Reminder has "new, reminder, test, random" labels assigned

  @not_implemented
  Scenario Outline: Labels filtering works correctly
    Given I go to Google Keep web app
    When  I go to <label> filter
    Then  There should be <num> of Notes displayed

    Examples:
      |label|num|
      |new  |2  |
      |reminder|1|
      |note    |1|
      |test    |2|
      |random  |2|