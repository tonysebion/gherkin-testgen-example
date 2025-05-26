Feature: Event Registration

  Scenario: Add accommodations if needed
    Given I check the box labeled "I need special accommodations"
    Then I should see a text area labeled "Please describe your accommodations"
