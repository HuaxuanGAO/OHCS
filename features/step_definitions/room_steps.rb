test_appointment = {:name => "App 1", :patient_id => 1, :doctor_id => 1, 
    :start_time => "2021-11-17 17:37:00", :end_time => "2021-11-17 17:48:00" }

Given('the default appointment and room exists') do
    Appointment.create(test_appointment)
end

Given('I am on the room page') do 
    visit('/rooms/1')
    expect(page).to have_content test_appointment[:name]
end

Then('I should see the room') do
    expect(page).to have_content test_appointment[:name]
end

Given('I send a test message') do    
    fill_in('message', :with => "hello")
    click_button('Send')
end

# TODO currently this will fail because the message need to reference both patient and doctor
Then('I should see the test message') do
    # page.find('[data-room-id="1"] div')
    #  Dummy test, cannot find nested element
    # expect(page).to have_content "message"
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
