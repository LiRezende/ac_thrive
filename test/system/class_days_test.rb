require "application_system_test_case"

class ClassDaysTest < ApplicationSystemTestCase
  setup do
    @class_day = class_days(:one)
  end

  test "visiting the index" do
    visit class_days_url
    assert_selector "h1", text: "Class Days"
  end

  test "creating a Class day" do
    visit class_days_url
    click_on "New Class Day"

    fill_in "Name", with: @class_day.name
    click_on "Create Class day"

    assert_text "Class day was successfully created"
    click_on "Back"
  end

  test "updating a Class day" do
    visit class_days_url
    click_on "Edit", match: :first

    fill_in "Name", with: @class_day.name
    click_on "Update Class day"

    assert_text "Class day was successfully updated"
    click_on "Back"
  end

  test "destroying a Class day" do
    visit class_days_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class day was successfully destroyed"
  end
end
