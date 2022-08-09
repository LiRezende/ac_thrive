require "application_system_test_case"

class IdiomsTest < ApplicationSystemTestCase
  setup do
    @idiom = idioms(:one)
  end

  test "visiting the index" do
    visit idioms_url
    assert_selector "h1", text: "Idioms"
  end

  test "creating a Idiom" do
    visit idioms_url
    click_on "New Idiom"

    fill_in "Idiom level", with: @idiom.idiom_level
    fill_in "Idiom name", with: @idiom.idiom_name
    click_on "Create Idiom"

    assert_text "Idiom was successfully created"
    click_on "Back"
  end

  test "updating a Idiom" do
    visit idioms_url
    click_on "Edit", match: :first

    fill_in "Idiom level", with: @idiom.idiom_level
    fill_in "Idiom name", with: @idiom.idiom_name
    click_on "Update Idiom"

    assert_text "Idiom was successfully updated"
    click_on "Back"
  end

  test "destroying a Idiom" do
    visit idioms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Idiom was successfully destroyed"
  end
end
