Feature: Customer Feedback Form

  Scenario: User submits feedback with a comment
    Given I am on the feedback page
    When I enter my name "Alex", email "alex@example.com", and rating "5"
    And I enter a comment "Great service!"
    Then the form should submit successfully
