Feature: existing user create room
  As a existing user
  I want to create a room

Background: default user logged in
  Given I have login with the correct credential

Scenario: user create a room
  Given I am on the dashboard
  And I create a room
  Then I should see the room

Scenario: user enter a room
  Given I am on the dashboard
  And I create a room
  And I enter room
  Then I should be in the room