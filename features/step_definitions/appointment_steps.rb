
test_patient = {:role => "patient", :email => "user@host.com", :username => "user", 
    :password => "testtest", :first_name => "one", :last_name => "tester", :birthday => "11-11-2000"}
test_doctor = {:role => "doctor", :email => "doctor@host.com", :username => "doctor", 
    :password => "testtest", :first_name => "three", :last_name => "tester", :birthday => "11-11-2000"}
test_appointment = {:name => "App 1", :patient_id => 1, :doctor_id => 1, 
    :start_time => "2021-11-17 17:37:00", :end_time => "2021-11-17 17:48:00" }

Given('the default patient and doctor exist') do
    User.create(test_patient)
    User.create(test_doctor)
end

Given('I am on the appointment page') do
    visit('/appointments')
    expect(page).to have_content "Appointments"
end

Given('I am on the new appointment page') do
    visit('/appointments/new')
    expect(page).to have_content "New Appointment"
end

Then('I should be on the new appointment page') do
    expect(page).to have_content "New Appointment"
end

Given('I fill in new appointment form') do
    fill_in('Name', :with => test_appointment[:name])
    fill_in('Start time', :with => test_appointment[:start_time])
    fill_in('End time', :with => test_appointment[:end_time])
    doctor = Doctor.first
    select('Doctor', :with=> doctor.first_name+" "+doctor.last_name)
    click_button('Create Appointment')
end