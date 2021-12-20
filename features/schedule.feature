Feature: doctor set schedules
  As a existing user
  I want set my available timeslot

Background: doctor exists
  Given the default doctor exists
  And the doctor is in department "Surgery"
  And the doctor is available at "December 30 15:00" to "December 30 16:00"

Scenario: edit schedule
  Given I have login with the doctor credential
  And I am on the schedule page
  Then I should see "All Schedules"
  Then I follow "Edit schedule"
  Then I should see "Update Schedule"

