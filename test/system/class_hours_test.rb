require "application_system_test_case"

class ClassHoursTest < ApplicationSystemTestCase
  setup do
    @class_hour = class_hours(:one)
  end

  test "visiting the index" do
    visit class_hours_url
    assert_selector "h1", text: "Class Hours"
  end

  test "creating a Class hour" do
    visit class_hours_url
    click_on "New Class Hour"

    fill_in "Class day", with: @class_hour.class_day_id
    fill_in "Description", with: @class_hour.description
    click_on "Create Class hour"

    assert_text "Class hour was successfully created"
    click_on "Back"
  end

  test "updating a Class hour" do
    visit class_hours_url
    click_on "Edit", match: :first

    fill_in "Class day", with: @class_hour.class_day_id
    fill_in "Description", with: @class_hour.description
    click_on "Update Class hour"

    assert_text "Class hour was successfully updated"
    click_on "Back"
  end

  test "destroying a Class hour" do
    visit class_hours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class hour was successfully destroyed"
  end
end
