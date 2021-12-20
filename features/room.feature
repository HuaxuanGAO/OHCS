Feature: existing user enter chat room
  As a existing user
  I want to enter a room

Background: default user logged in
  Given the default patient exists
  Given the default doctor exists
  And the doctor is in department "Neurology"
  And the doctor is available at "December 29 14:30" to "December 29 16:30"
  And the default appointment and room exists


Scenario: user enter a room  
  Given I have login with the correct credential
  And I am on the appointment page
  And I follow "Enter Chat Room"
  Then I should see the room

Scenario: patient send message
  Given I have login with the correct credential
  And I am on the room page
  And I send a test message "hello"
  Then I should see the test message "hello"

Scenario: doctor send message  
  Given I have login with the doctor credential
  And I am on the room page
  And I send a test message "hi"
  Then I should see the test message "hi"