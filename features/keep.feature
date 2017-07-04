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
    And   Fill in Title with Test Reminedr Title
    And   Fill in Note content with Test Reminder Content
    And   Set reminder to Later Today
    Then  I save the Reminder
    And   Verify created Note with Title:Test Reminedr Title and Content:Test Reminedr Title
    And   Verify that date-time is Today, 8:00 PM