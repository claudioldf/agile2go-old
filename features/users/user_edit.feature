Feature: Edit User
  As a registered user of the website
  I want to edit my user profile  

    Scenario: I sign in and edit my account
      Given I am logged in
      When I edit my account name
      Then I should see an account edited message

    Scenario: I sign in and edit my account
      Given I am logged in
      When I change my password
      Then I should see an account edited message
      When I sign out
      Then I should be signed out
      When I sign in
      Then I should be signed in