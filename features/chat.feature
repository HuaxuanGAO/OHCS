Feature: user chat in a room
  As a user in a chat room
  I want to chat

Background: default user default room default doctor
  Given I have login with the correct credential
  And I have entered a room

Scenario: existing user send message
  Given I send a test message
  And a doctor exists
  Then I should see the test message