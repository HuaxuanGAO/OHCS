Feature: patient make appointment
  As a existing user
  I want to make an appointment

Background: default patient and doctor exists
  Given the default patient exists
  And the default doctor exists
  And the doctor is in department "Neurology"
  And the doctor is available at "December 29 15:00" to "December 29 16:00"

Scenario: go to new appointment page for patient
  Given I have login with the correct credential
  And I am on the appointment page
  And I follow "New Appointment"
  Then I should be on the new appointment page for patient

Scenario: go to appointment page as doctor
  Given I have login with the doctor credential
  And I am on the appointment page
  Then I should not see "New Appointment"

Scenario: make a new appointment as patient
  Given I have login with the correct credential
  And I am on the new appointment page for patient
  And I select "Neurology" from "department"
  Then I press "Next"
  And I should see "Step 2"
  Then I follow "Test Doctor"
  And I should see "Step 3" 
  Then I follow "Schedule on 2021-12-29 15:00:00 UTC - 2021-12-29 16:00:00 UTC"
  Then I follow "2021-12-29 15:00:00 UTC - 2021-12-29 15:30:00 UTC"
  Then I fill in "Name" with "test1"
  Then I press "Create Appointment"
  Then I should see "Appointment was successfully created."
  Then I am on the appointment page
  And I follow "Calendar View"

  