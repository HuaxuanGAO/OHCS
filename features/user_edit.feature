Feature: existing user edit password or email
  As an existing user
  I want to edit my password and email


Background: users in database

  Given the following users exist:
  |    email   |  username  |  password  |  first_name  |  last_name  |  birthday  |  gender | role |
  |  user@host.com  |  user  |  testtest  |  TestFirst  |  TestLast  |  02-02-2000  | Male | patient |


Scenario: existing user change password with invalid password
  Given I have login with the correct credential
  Then I should be on the profile page
  And I follow "Change Password or Delete"
  Then I should see "Edit"
  And I fill in "Email" with "useredit@host.com"
  And I fill in "Current password" with "useredit2"
  And I fill in "Password" with "useredit2"
  And I fill in "Password confirmation" with "useredit2"
  And I press "Update"
  Then I should see "Current password is invalid"

Scenario: existing user change password with valid password
  Given I have login with the correct credential
  Then I should be on the profile page
  And I follow "Change Password or Delete"
  Then I should see "Edit"
  And I fill in "Email" with "useredit@host.com"
  And I fill in "Current password" with "testtest"
  And I fill in "Password" with "useredit2"
  And I fill in "Password confirmation" with "useredit2"
  And I press "Update"
  Then I should see "Patient Profile"