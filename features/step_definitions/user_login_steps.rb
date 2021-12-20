Capybara.match = :prefer_exact

test_user = {:email => "user@host.com", :username => "user", 
  :password => "testtest", :first_name => "one", :last_name => "tester", :birthday => "11-11-2000"}

Given ('I have signed up as default test user') do
  visit('/users/sign_up')
  fill_in('Email', :with => test_user[:email])
  fill_in('Username', :with => test_user[:username])
  fill_in('First name', :with => test_user[:first_name])
  fill_in('Last name', :with => test_user[:last_name])
  fill_in('Password', :with => test_user[:password])
  fill_in('Password confirmation', :with => test_user[:password])
  click_button('Sign up')
end

Then('I should be on the home page') do
  expect(page).to have_content "Log in"
end

Then('I should be on the profile page') do
  expect(page).to have_content "Profile"
  expect(page).to have_content "Edit Info"
end

Then('I should be on the log in page') do
  expect(page).to have_content "Log in"
end

And('I should see invalid login message') do
  expect(page).to have_content "Invalid Email or password"
end

Given('the default test user exist') do
  User.create(test_user)
end

And('I check others profile') do
  visit('/users/2/profile')
end

Then('I should see my own profile') do
  expect(page).to have_content "one"
  expect(page).to have_content "tester"
end

Given('I have login with the correct credential') do
  visit('/users/sign_in')
  fill_in('Email', :with => test_user[:email])
  fill_in('Password', :with => test_user[:password])
  click_button('Log in')
end

Given('I have login with the wrong credential') do
  visit('/users/sign_in')
  fill_in('Email', :with => test_user[:email])
  fill_in('Password', :with => 'wrong')
  click_button('Log in')
end

Given('I logout') do
  click_button('Logout')
end

Then('I should see the sign out message') do
  expect(page).to have_content "Signed out successfully"
  visit('/users')
end