Feature: Event Registration

  Scenario: Register with name and date
    Given I enter my name "Alex"
    And I select an event date "2025-09-10"
    Then I should be registered
