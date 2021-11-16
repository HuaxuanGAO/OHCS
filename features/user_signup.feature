Feature: new user sign up
  As a new user
  I want to sign up


Background: user in database

  Given the following users exist:
  |    email   |  username  |  password  |  first_name  |  last_name  |  birthday  |  gender |
  |  usersignup@host.com  |  usersignup  |  testtest  |  TestFirst  |  TestLast  |  02-02-2000  | Male |


Scenario: user sign up with existed email and username
  Given I am on the general login page
  And I follow "I am a user"
  And I follow "Sign up"
  And I fill in "Email" with "usersignup@host.com"
  And I fill in "Username" with "usersignup"
  And I fill in "Last name" with "test1"
  And I fill in "First name" with "test1"
  And I select "Male" from "Gender"
  And I select "Sign up as a " from "Role"
  And I fill in "Password" with "testtest"
  And I fill in "Password confirmation" with "testtest"
  And I press "Sign up"
  Then I should see "Email has already been taken"
  And I should see "Username has already been taken"

Scenario: user sign up with invalid email
  Given I am on the general login page
  And I follow "I am a user"
  And I follow "Sign up"
  And I fill in "Email" with "usersignup"
  And I fill in "Username" with "usersignup"
  And I fill in "Last name" with "test1"
  And I fill in "First name" with "test1"
  And I select "Male" from "Gender"
  And I fill in "Password" with "testtest"
  And I fill in "Password confirmation" with "testtest"
  And I press "Sign up"
  Then I should see "Email is invalid"


Scenario: new user sign up 
  Given I am on the general login page
  And I follow "I am a user"
  And I follow "Sign up"
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


