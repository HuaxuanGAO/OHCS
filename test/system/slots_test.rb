require "application_system_test_case"

class SlotsTest < ApplicationSystemTestCase
  setup do
    @slot = slots(:one)
  end

  test "visiting the index" do
    visit slots_url
    assert_selector "h1", text: "Slots"
  end

  test "creating a Slot" do
    visit slots_url
    click_on "New Slot"

    check "Available" if @slot.available
    fill_in "End time", with: @slot.end_time
    fill_in "Schedule", with: @slot.schedule_id
    fill_in "Start time", with: @slot.start_time
    click_on "Create Slot"

    assert_text "Slot was successfully created"
    click_on "Back"
  end

  test "updating a Slot" do
    visit slots_url
    click_on "Edit", match: :first

    check "Available" if @slot.available
    fill_in "End time", with: @slot.end_time
    fill_in "Schedule", with: @slot.schedule_id
    fill_in "Start time", with: @slot.start_time
    click_on "Update Slot"

    assert_text "Slot was successfully updated"
    click_on "Back"
  end

  test "destroying a Slot" do
    visit slots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Slot was successfully destroyed"
  end
end
