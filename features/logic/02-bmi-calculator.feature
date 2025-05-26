Feature: BMI Calculation

  Scenario: Calculate BMI from height and weight
    Given I enter height "180" cm and weight "75" kg
    Then my BMI should be "23.15"
