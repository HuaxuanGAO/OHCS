Feature: patient chat in a room
  As a patient in a chat room
  I want to chat

Background: default patient default room default doctor
  Given I have login with the correct credential
  And a doctor exists
  And I have entered a room

Scenario: existing patient send message
  Given I send a test message
  And a doctor exists
  Then I should see the test message