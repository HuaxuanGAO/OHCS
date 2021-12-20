Feature: user check slots
  As a existing user
  I want to check my time slots

Background: default doctor and schedule exists 
    Given the default doctor exists
    And the doctor is in department "Neurology"
    And the doctor is available at "December 29 15:00" to "December 29 15:30"

Scenario: edit the detail of a slot
    Given I have login with the doctor credential
    And I am on the slot page
    And I follow "Edit"
    Then I should see "Editing Slot"
    Then I change the slot info
    And press "Update Slot"
    Then I should see "Slot was successfully updated."

Scenario: should not add new slot to unavailable
    Given I have login with the doctor credential
    And I am on the slot page
    And I follow "New Slot"
    Then I should see "New Slot"
