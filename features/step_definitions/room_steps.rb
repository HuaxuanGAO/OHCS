test_room = {:id => 1, :name => "test room"}

Given('I am on the dashboard') do
    visit('/dashboard')
    expect(page).to have_content "Create a room"
end

Given('I create a room') do
    click_link('Create a room')
    fill_in('Name', :with => test_room[:name])
    click_button('Save')
end

Then('I should see the room') do
    expect(page).to have_content test_room[:name]
end

Given('I enter room') do
    visit('/dashboard')
    expect(page).to have_content "Create a room"
    click_link(test_room[:name])
    # click_button(test_room[:name])
end

Then('I should be in the room') do
    expect(page).to have_content test_room[:name]
end


Given('I have entered a room') do
    Room.create(test_room)
    visit('/rooms/1')
  end