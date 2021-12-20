test_doctor = {:role => "doctor", :email => "doctor@host.com", :username => "doctor", 
    :password => "testtest", :first_name => "Test", :last_name => "Doctor", :birthday => "11-11-2000"}

When /the doctor is available at "([^ "]*) ([^-"]*) ([^:"]*):([^:"]*)" to "([^ "]*) ([^-"]*) ([^:"]*):([^:"]*)"$/ do |sm,sday,shour,smin,em,eday,ehour,emin|
    visit('/schedules')
    # expect(page).to have_content "Set up / modify your schedule"
    # click_button('Set up / modify your schedule')
    expect(page).to have_content "Schedule a new session"
    click_link('Schedule a new session')
    select(sm, :from => "schedule[start_time(2i)]")
    select(sday, :from => "schedule[start_time(3i)]")
    select(shour, :from => "schedule[start_time(4i)]")
    select(smin, :from => "schedule[start_time(5i)]")
    select(em, :from => "schedule[end_time(2i)]")
    select(eday, :from => "schedule[end_time(3i)]")
    select(ehour, :from => "schedule[end_time(4i)]")
    select(emin, :from => "schedule[end_time(5i)]")
    click_button('Create Schedule')
    click_button('Logout')
end

Given('I am on the schedule page') do
    visit('/schedules')
end