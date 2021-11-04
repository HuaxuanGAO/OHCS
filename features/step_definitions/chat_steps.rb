Given('I send a test message') do    
    fill_in('message', :with => "hello")
    click_button('Send')    
end

# TODO currently this will fail because the message need to reference both patient and doctor
Then('I should see the test message') do
    page.find('[data-room-id="1"] div')
    expect(page).to have_content "hello"
end

Given('a doctor exists') do
    Doctor.create({:id=>1, :username=>"test", :email=>"1", :password=>"111111", :first_name => "one", :last_name => "tester", :birthday => "11-11-2000"})
end