
test_patient = {:role => "patient", :email => "user@host.com", :username => "user", 
    :password => "testtest", :first_name => "one", :last_name => "tester", :birthday => "11-11-2000"}
test_doctor = {:role => "doctor", :email => "doctor@host.com", :username => "doctor", 
    :password => "testtest", :first_name => "Test", :last_name => "Doctor", :birthday => "11-11-2000"}

Given('the default patient exists') do
    User.create(test_patient)
end

Given('the default doctor exists') do
    User.create(test_doctor)
end

When /the doctor is in department "([^"]*)"$/ do |department|
    visit('/users/sign_in')
    fill_in('Email', :with => test_doctor[:email])
    fill_in('Password', :with => test_doctor[:password])
    click_button('Log in')
    click_link('Edit Info')
    select(department, :from => "Department")
    click_button('Update')
end

Given('I am on the appointment page') do
    click_button("Appointments")
end

Given('I have login with the doctor credential') do
    visit('/users/sign_in')
    fill_in('Email', :with => test_doctor[:email])
    fill_in('Password', :with => test_doctor[:password])
    click_button('Log in')
end

# patient
Given('I am on the new appointment page for patient') do
    visit('/appointment/department')
    expect(page).to have_content "Step 1"
end


Then('I should be on the new appointment page for patient') do
    expect(page).to have_content "Step 1"
end

Given('I fill in new appointment form') do
    fill_in('Name', :with => test_appointment[:name])
    fill_in('Start time', :with => test_appointment[:start_time])
    fill_in('End time', :with => test_appointment[:end_time])
    doctor = Doctor.first
    select('Doctor', :with=> doctor.first_name+" "+doctor.last_name)
    click_button('Create Appointment')
end