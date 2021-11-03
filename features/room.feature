Feature: existing patient chat
  As a existing patient
  I want to create a room

Background: default patient logged in
  Given I have login with the correct credential

Scenario: patient create a room
  Given I am on the dashboard
  And I create a room
  Then I should see the room

Scenario: patient enter a room
  Given I am on the dashboard
  And I create a room
  And I enter room
  Then I should be in the room