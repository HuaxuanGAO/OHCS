Feature: new patient sign up
  As a new patient
  I want to sign up


Background: patients in database

  Given the following patients exist:
  |    email   |  username  |  password  |  first_name  |  last_name  |  birthday  |  gender |
  |  patientsignup@host.com  |  patientsignup  |  testtest  |  TestFirst  |  TestLast  |  02-02-2000  | Male |


Scenario: patient sign up with existed email and username
  Given I am on the general login page
  And I follow "I am a patient"
  And I follow "Sign up"
  And I fill in "Email" with "patientsignup@host.com"
  And I fill in "Username" with "patientsignup"
  And I fill in "Last name" with "test1"
  And I fill in "First name" with "test1"
  And I select "Male" from "Gender"
  And I fill in "Password" with "testtest"
  And I fill in "Password confirmation" with "testtest"
  And I press "Sign up"
  Then I should see "Email has already been taken"
  And I should see "Username has already been taken"

Scenario: patient sign up with invalid email
  Given I am on the general login page
  And I follow "I am a patient"
  And I follow "Sign up"
  And I fill in "Email" with "patientsignup"
  And I fill in "Username" with "patientsignup"
  And I fill in "Last name" with "test1"
  And I fill in "First name" with "test1"
  And I select "Male" from "Gender"
  And I fill in "Password" with "testtest"
  And I fill in "Password confirmation" with "testtest"
  And I press "Sign up"
  Then I should see "Email is invalid"


Scenario: new patient sign up 
  Given I am on the general login page
  And I follow "I am a patient"
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


