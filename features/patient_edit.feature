Feature: existing patient edit password or email
  As an existing patient
  I want to edit my password and email


Background: patients in database

  Given the following patients exist:
  |    email   |  username  |  password  |  first_name  |  last_name  |  birthday  |  gender |
  |  patientedit@host.com  |  patientedit  |  testtest  |  TestFirst  |  TestLast  |  02-02-2000  | Male |


Scenario: existing patient change password with invalid password
  Given I have logged in as "patientedit@host.com" with "patientedit"
  And I press "Change Password or Delete"
  Then I should see "Edit Patient"
  And I fill in "Email" with "patientedit@host.com"
  And I fill in "Current password" with "patientedit2"
  And I fill in "Password" with "patientedit2"
  And I fill in "Password confirmation" with "patientedit2"
  And I press "Update"
  Then I should see "Current password is invalid"

Scenario: existing patient change password with valid password
  Given I have logged in as "patientedit@host.com" with "patientedit"
  And I press "Change Password or Delete"
  Then I should see "Edit Patient"
  And I fill in "Email" with "patientedit@host.com"
  And I fill in "Current password" with "patientedit"
  And I fill in "Password" with "patientedit2"
  And I fill in "Password confirmation" with "patientedit2"
  And I press "Update"
  Then I should see "I am a doctor"