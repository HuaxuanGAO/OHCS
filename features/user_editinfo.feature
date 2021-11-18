Feature: existing user edit general information
  As an existing user
  I want to edit my genenral information like name and birthday


Background: users in database

  Given the following users exist:
  |    email   |  username  |  password  |  first_name  |  last_name  |  birthday  |  gender | role |
  |  user@host.com  |  user  |  testtest  |  TestFirst  |  TestLast  |  02-02-2000  | Male | doctor |


Scenario: existing user change password with invalid password
  Given I have login with the correct credential
  Then I should be on the profile page
  And I follow "Edit Info"
  Then I should see "Edit Profile"
  And I fill in "First name" with "editinfoFirst"
  And I press "Update"
  Then I should see "Doctor Profile"
  And I should see "Name: editinfoFirst TestLast"