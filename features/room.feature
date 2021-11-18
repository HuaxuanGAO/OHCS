Feature: existing user enter chat room
  As a existing user
  I want to enter a room

Background: default user logged in
  Given the default patient and doctor exist  
  And the default appointment and room exists  
  And I have login with the correct credential

Scenario: user enter a room  
  Given I am on the appointment page
  And I follow "Enter Chat Room"
  Then I should see the room

Scenario: user send message  
  Given I am on the room page
  And I send a test message
  Then I should see the test message