Feature: patient chat in a room
  As a patient in a chat room
  I want to chat

Background: default patient default room
  Given I have login with the correct credential
  And I have entered a room

# Scenario: existing patient send message
#   Given I send a test message
#   Then I should see the test message