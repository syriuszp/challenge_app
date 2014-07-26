Feature: Leaderboard
  To promote Q&A activities users can see points
  rating leaders on dedicated page

  Background:
    Given I am user
    And there is user2 with 110 points
    
  Scenario: Seeing users ranking
     When I am on leaderboard
     Then I can see on first place user2
  