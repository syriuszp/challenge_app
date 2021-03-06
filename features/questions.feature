Feature: Questions
  In order to add questions
  I need to create a profile first
  Then I can add, edit and delete my own questions

  Background:
    Given not my question exist
    And I am user

  Scenario: Creating questions
     When I create a question
     Then I should see this question
     
  Scenario: Delete question
     When I created a question
     And I press "Delete" link
     Then I should see message "Question was successfully destroyed."
     

  Scenario: Creating questions with empty title
     When I create a question with empty title
     Then I should not see this question
      And I should see the error message

  Scenario: Edit not my question
     When I open not my question's page
     Then I do not see "Edit" link on this question's page

  Scenario: Delete not my question
     When I open not my question's page
     Then I do not see "Delete" link on this question's page
