Feature: Registration
  To contributes/benefits in/from site
  I need to create a profile first

  Background:

  Scenario: Receiving free points
     When I create a profile
     Then I should have 100 points

