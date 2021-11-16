Feature: existing user edit general information
  As an existing user
  I want to edit my genenral information like name and birthday


Background: users in database

  Given the following users exist:
  |    email   |  username  |  password  |  first_name  |  last_name  |  birthday  |  gender |
  |  usereditinfo@host.com  |  usereditinfo  |  testtest  |  TestFirst  |  TestLast  |  02-02-2000  | Male |


Scenario: existing user change password with invalid password
  Given I have logged in as "usereditinfo@host.com" with "usereditinfo"
  And I press "Edit Info"
  Then I should see "Edit Profile"
  And I fill in "First name" with "editinfoFirst"
  And I press "Update"
  Then I should see "Doctor Profile"
  And I should see "Name: editinfoFirst TestLast"