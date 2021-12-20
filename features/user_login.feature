Feature: existing user log in
  As a existing user
  I want to log in

Background: default user exists
  Given the default test user exist
  Given the default doctor exists

Scenario: existing user login correct password
  Given I have login with the correct credential
  Then  I should be on the profile page

Scenario: existing user login wrong password
  Given I have login with the wrong credential
  Then  I should be on the log in page 
  And I should see invalid login message

Scenario: user logout
  Given I have login with the correct credential
  And I logout
  Then I should be on the home page
  And I should see the sign out message

Scenario: check other user's profile
  Given I have login with the correct credential
  And I check others profile
  Then I should see my own profile