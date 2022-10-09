require "application_system_test_case"

class TeachersTest < ApplicationSystemTestCase
  setup do
    @teacher = teachers(:one)
  end

  test "visiting the index" do
    visit teachers_url
    assert_selector "h1", text: "Teachers"
  end

  test "creating a Teacher" do
    visit teachers_url
    click_on "New Teacher"

    fill_in "Class day", with: @teacher.class_day_id
    fill_in "Class hour", with: @teacher.class_hour_id
    fill_in "Fee", with: @teacher.fee
    fill_in "Idiom", with: @teacher.idiom_id
    fill_in "Person", with: @teacher.person_id
    click_on "Create Teacher"

    assert_text "Teacher was successfully created"
    click_on "Back"
  end

  test "updating a Teacher" do
    visit teachers_url
    click_on "Edit", match: :first

    fill_in "Class day", with: @teacher.class_day_id
    fill_in "Class hour", with: @teacher.class_hour_id
    fill_in "Fee", with: @teacher.fee
    fill_in "Idiom", with: @teacher.idiom_id
    fill_in "Person", with: @teacher.person_id
    click_on "Update Teacher"

    assert_text "Teacher was successfully updated"
    click_on "Back"
  end

  test "destroying a Teacher" do
    visit teachers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teacher was successfully destroyed"
  end
end
