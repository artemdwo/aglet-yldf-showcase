@google @keep
Feature: Google Keep

  Background: Login into Google Account
    Given I am on the Account Login page
    When  Enter login
    And   Enter password
    And   Submit login details

  Scenario: Google Keep web app is accessible
    Given I open Google Keep web app
    Then  I am on Main Google Keep page

  Scenario: Create a Note
    Given I open Google Keep web app
    When  I select Note template
    And   Fill in Title with Test Title
    And   Fill in Note content with Test Note Content
    Then  I save the Note
    And   Verify created Note with Title:Test Title and Content:Test Note Content

  Scenario: Create a Reminder
    Given I open Google Keep web app
    When  I select Note template
    And   Fill in Title with Test Reminder Title
    And   Fill in Note content with Test Reminder Content
    And   Set reminder to Later Today
    Then  I save the Reminder
    And   Verify created Note with Title:Test Reminder Title and Content:Test Reminder Content
    And   Verify that date-time is Today, 8:00 PM

  Scenario: Archive a Note
    Given I open Google Keep web app
    And   I find a Note with Title:Test Title and Content:Test Note Content
    When  I archive the Note
    Then  The Note with Title:Test Title and Content:Test Note Content should appear in Archive tab

  Scenario: Unarchive a Note
    Given I open Google Keep web app
    And   I go to Archived tab
    And   I find a Note with Title:Test Title and Content:Test Note Content
    When  I unarchive the Note
    And   I go to Notes tab
    Then  Verify present Note with Title:Test Title and Content:Test Note Content

  Scenario: Delete a Note
    Given I open Google Keep web app
    And   I find a Note with Title:Test Title and Content:Test Note Content
    When  I delete the Note
    Then  The Note with Title:Test Title and Content:Test Note Content should appear in Trash tab

  Scenario: Delete Forever a Note
    Given I open Google Keep web app
    And   I go to Trash tab
    And   I find a Note with Title:Test Title and Content:Test Note Content
    When  I evaporate the Note
    Then  Empty Trash link should disappear

  Scenario: Multi-select Notes delete and clean-up
    Given I open Google Keep web app
    When  I select all available Notes
    And   I delete all the Note
    And   I go to Trash tab
    And   Empty the Trash
    Then  Empty Trash link should disappear