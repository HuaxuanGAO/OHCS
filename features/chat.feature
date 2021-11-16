Feature: user chat in a room
  As a user in a chat room
  I want to chat

Scenario: existing user send message  
  Given I have login with the correct credential
  And the default test user exist
  And I have entered a room
  Then I should see "message"
  Given I send a test message
  Then I should see the test message