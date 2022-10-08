require "application_system_test_case"

class IdiomLevelsTest < ApplicationSystemTestCase
  setup do
    @idiom_level = idiom_levels(:one)
  end

  test "visiting the index" do
    visit idiom_levels_url
    assert_selector "h1", text: "Idiom Levels"
  end

  test "creating a Idiom level" do
    visit idiom_levels_url
    click_on "New Idiom Level"

    fill_in "Idiom", with: @idiom_level.idiom_id
    fill_in "Name", with: @idiom_level.name
    click_on "Create Idiom level"

    assert_text "Idiom level was successfully created"
    click_on "Back"
  end

  test "updating a Idiom level" do
    visit idiom_levels_url
    click_on "Edit", match: :first

    fill_in "Idiom", with: @idiom_level.idiom_id
    fill_in "Name", with: @idiom_level.name
    click_on "Update Idiom level"

    assert_text "Idiom level was successfully updated"
    click_on "Back"
  end

  test "destroying a Idiom level" do
    visit idiom_levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Idiom level was successfully destroyed"
  end
end
