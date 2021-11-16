Feature: existing user edit password or email
  As an existing user
  I want to edit my password and email


Background: users in database

  Given the following users exist:
  |    email   |  username  |  password  |  first_name  |  last_name  |  birthday  |  gender |
  |  useredit@host.com  |  useredit  |  testtest  |  TestFirst  |  TestLast  |  02-02-2000  | Male |


Scenario: existing user change password with invalid password
  Given I have logged in as "useredit@host.com" with "useredit"
  And I press "Change Password or Delete"
  Then I should see "Edit Patient"
  And I fill in "Email" with "useredit@host.com"
  And I fill in "Current password" with "useredit2"
  And I fill in "Password" with "useredit2"
  And I fill in "Password confirmation" with "useredit2"
  And I press "Update"
  Then I should see "Current password is invalid"

Scenario: existing user change password with valid password
  Given I have logged in as "useredit@host.com" with "useredit"
  And I press "Change Password or Delete"
  Then I should see "Edit Patient"
  And I fill in "Email" with "useredit@host.com"
  And I fill in "Current password" with "useredit"
  And I fill in "Password" with "useredit2"
  And I fill in "Password confirmation" with "useredit2"
  And I press "Update"
  Then I should see "I am a doctor"