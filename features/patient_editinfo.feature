Feature: existing patient edit general information
  As an existing patient
  I want to edit my genenral information like name and birthday


Background: patients in database

  Given the following patients exist:
  |    email   |  username  |  password  |  first_name  |  last_name  |  birthday  |  gender |
  |  patienteditinfo@host.com  |  patienteditinfo  |  testtest  |  TestFirst  |  TestLast  |  02-02-2000  | Male |


Scenario: existing patient change password with invalid password
  Given I have logged in as "patienteditinfo@host.com" with "patienteditinfo"
  And I press "Edit Info"
  Then I should see "Edit Profile"
  And I fill in "First name" with "editinfoFirst"
  And I press "Update"
  Then I should see "Doctor Profile"
  And I should see "Name: editinfoFirst TestLast"