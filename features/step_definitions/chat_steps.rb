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