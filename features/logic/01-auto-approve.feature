Feature: Loan Application

  Scenario: Auto-approve loan if conditions are met
    Given I enter my income, loan amount, and credit score
    Then I should be auto-approved if the amount is under 10000 and credit score is above 720
    And the application should require manual review otherwise
