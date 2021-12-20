test_doctor = {:role => "doctor", :email => "doctor@host.com", :username => "doctor", 
    :password => "testtest", :first_name => "Test", :last_name => "Doctor", :birthday => "11-11-2000"}
test_patient = {:role => "patient", :email => "user@host.com", :username => "user", 
    :password => "testtest", :first_name => "one", :last_name => "tester", :birthday => "11-11-2000"}

Given('the default appointment and room exists') do
    # Schedule.create(test_sched)
    # Slot.create(test_slot)
    # Appointment.create(test_appointment)
    visit('/users/sign_in')
    fill_in('Email', :with => test_patient[:email])
    fill_in('Password', :with => test_patient[:password])
    click_button('Log in')
    visit('/appointment/department')
    select("Neurology", :from => "department")
    click_button("Next")
    click_link("Test Doctor")
    click_link("Schedule on 2021-12-29 14:30:00 UTC - 2021-12-29 16:30:00 UTC")
    click_link("2021-12-29 15:00:00 UTC - 2021-12-29 15:30:00 UTC")
    fill_in("Name", :with=>"test1")
    click_button("Create Appointment")
    click_button('Logout')
end

Given('I am on the room page') do 
    visit('/rooms/1')
    expect(page).to have_content "test1"
end

Then('I should see the room') do
    expect(page).to have_content "test1"
end

When /I send a test message "([^"]*)"/ do |text|
    fill_in('message_message', :with => text)
    click_button('Send')
end

# TODO currently this will fail because the message need to reference both patient and doctor
When /I should see the test message "([^"]*)"/ do |text|
    expect(Message.where(:message=>text)).to exist
end

# Given('I create a room') do
#     click_link('Create a room')
#     fill_in('Name', :with => test_appointment[:name])
#     click_button('Save')
# end

# Given('I enter room') do
#     visit('/dashboard')
#     expect(page).to have_content "Create a room"
#     click_link(test_appointment[:name])
#     # click_button(test_appointment[:name])
# end
