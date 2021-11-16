Given /^(?:|I )have logged in as "([.@]*)" with "(.*)"$/ do |email, pwd| 
    visit('/users/sign_in')
    fill_in('Email', email)
    fill_in('Password', pwd)
    click_button('Log in')
end
