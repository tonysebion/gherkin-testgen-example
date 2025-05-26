Feature: Customer Feedback Form

  Scenario: Ask for explanation if rating is low
    Given I am on the feedback page and i am going to leave a low rating
    When I rate the experience "2"
    Then I should be asked to explain the rating
