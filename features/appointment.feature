Feature: patient make appointment
  As a existing user
  I want to make an appointment

Background: default patient and doctor exists
  Given the default patient and doctor exist  

Scenario: go to new appointment page
  Given I have login with the correct credential
  And I am on the appointment page
  And I follow "New Appointment"
  Then I should be on the new appointment page

Scenario: make a new appointment
  Given I have login with the correct credential
  And I am on the new appointment page
  And I fill in new appointment form
  Then I press "Create Appointment"
  Then I should see "Appointment was successfully created."
