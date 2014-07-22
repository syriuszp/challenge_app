Feature: Username in profile
  To make site look friendly and simplify navigation
  user adds his name on registration to the profile.
  User name to be presented on each page instead of 
  his email address.

  Background:
     Given I create a profile 

  Scenario: See name instead email
     Then I should see my name

  Scenario: Change name in profile
     When I change username on "otheruser"
     Then I should see my new name