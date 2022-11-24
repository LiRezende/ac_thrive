require "application_system_test_case"

class DocumentsTest < ApplicationSystemTestCase
  setup do
    @document = documents(:one)
  end

  test "visiting the index" do
    visit documents_url
    assert_selector "h1", text: "Documents"
  end

  test "creating a Document" do
    visit documents_url
    click_on "New Document"

    fill_in "Cpf", with: @document.cpf
    fill_in "Expeditor", with: @document.expeditor
    fill_in "Father name", with: @document.father_name
    fill_in "Identity", with: @document.identity
    fill_in "Mother name", with: @document.mother_name
    fill_in "Nacionality", with: @document.nacionality
    fill_in "Person", with: @document.person_id
    click_on "Create Document"

    assert_text "Document was successfully created"
    click_on "Back"
  end

  test "updating a Document" do
    visit documents_url
    click_on "Edit", match: :first

    fill_in "Cpf", with: @document.cpf
    fill_in "Expeditor", with: @document.expeditor
    fill_in "Father name", with: @document.father_name
    fill_in "Identity", with: @document.identity
    fill_in "Mother name", with: @document.mother_name
    fill_in "Nacionality", with: @document.nacionality
    fill_in "Person", with: @document.person_id
    click_on "Update Document"

    assert_text "Document was successfully updated"
    click_on "Back"
  end

  test "destroying a Document" do
    visit documents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Document was successfully destroyed"
  end
end
