Feature: new user sign up
  As a new user
  I want to sign up


Background: user in database

  Given the following users exist:
  |    email   |  username  |  password  |  first_name  |  last_name  |  birthday  |  gender | role |
  |  user@host.com  |  user  |  testtest  |  TestFirst  |  TestLast  |  02-02-2000  | Male | patient |


Scenario: user sign up with existed email and username
  Given I am on the general login page
  And I follow "Sign up"
  And I select "patient" from "Sign up as"
  And I fill in "Email" with "user@host.com"
  And I fill in "Username" with "user"
  And I fill in "Last name" with "test1"
  And I fill in "First name" with "test1"
  And I select "Male" from "Gender"
  And I fill in "Password" with "testtest"
  And I fill in "Password confirmation" with "testtest"
  And I press "Sign up"
  Then I should see "Email has already been taken"
  And I should see "Username has already been taken"

Scenario: user sign up with invalid email
  Given I am on the general login page
  And I follow "Sign up"
  And I select "patient" from "Sign up as"
  And I fill in "Email" with "usersignup"
  And I fill in "Username" with "usersignup"
  And I fill in "Last name" with "test1"
  And I fill in "First name" with "test1"
  And I select "Male" from "Gender"
  And I fill in "Password" with "testtest"
  And I fill in "Password confirmation" with "testtest"
  And I press "Sign up"
  Then I should see "Email is invalid"


Scenario: new patient sign up 
  Given I am on the general login page
  And I follow "Sign up"
  And I select "patient" from "Sign up as"
  And I fill in "Email" with "test@host.com"
  And I fill in "Username" with "test"
  And I fill in "Last name" with "test1"
  And I fill in "First name" with "test1"
  And I select "Male" from "Gender"
  And I fill in "Password" with "testtest"
  And I fill in "Password confirmation" with "testtest"
  And I press "Sign up"
  Then I should see "Patient Profile"
  And I should see "Username: test"

Scenario: new doctor sign up 
  Given I am on the general login page
  And I follow "Sign up"
  And I select "doctor" from "Sign up as"
  And I fill in "Email" with "testdoc@host.com"
  And I fill in "Username" with "testdoc"
  And I fill in "Last name" with "test1"
  And I fill in "First name" with "test1"
  And I select "Male" from "Gender"
  And I fill in "Password" with "testtest"
  And I fill in "Password confirmation" with "testtest"
  And I press "Sign up"
  Then I should see "Doctor Profile"
  And I should see "Username: test"


