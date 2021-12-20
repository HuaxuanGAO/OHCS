Given('I am on the slot page') do 
    visit('/slots')
    expect(page).to have_content "Slots"
end

Given('I change the slot info') do
    select('16', :from => "slot[end_time(4i)]")
end

Given('I input wrong date info') do
    select('December', :from => "slot[start_time(2i)]")
    select('24', :from => "slot[start_time(3i)]")
    select('15', :from => "slot[start_time(4i)]")
    select('00', :from => "slot[start_time(5i)]")
    select('November', :from => "slot[end_time(2i)]")
    select('24', :from => "slot[end_time(3i)]")
    select('15', :from => "slot[end_time(4i)]")
    select('30', :from => "slot[end_time(5i)]")
    page.first(:css, 'option').click
end