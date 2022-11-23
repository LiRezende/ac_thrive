require "application_system_test_case"

class FinancialResponsiblesTest < ApplicationSystemTestCase
  setup do
    @financial_responsible = financial_responsibles(:one)
  end

  test "visiting the index" do
    visit financial_responsibles_url
    assert_selector "h1", text: "Financial Responsibles"
  end

  test "creating a Financial responsible" do
    visit financial_responsibles_url
    click_on "New Financial Responsible"

    fill_in "Cpf", with: @financial_responsible.cpf
    fill_in "Email", with: @financial_responsible.email
    fill_in "First name", with: @financial_responsible.first_name
    fill_in "Last name", with: @financial_responsible.last_name
    fill_in "Person", with: @financial_responsible.person_id
    fill_in "Phone", with: @financial_responsible.phone
    click_on "Create Financial responsible"

    assert_text "Financial responsible was successfully created"
    click_on "Back"
  end

  test "updating a Financial responsible" do
    visit financial_responsibles_url
    click_on "Edit", match: :first

    fill_in "Cpf", with: @financial_responsible.cpf
    fill_in "Email", with: @financial_responsible.email
    fill_in "First name", with: @financial_responsible.first_name
    fill_in "Last name", with: @financial_responsible.last_name
    fill_in "Person", with: @financial_responsible.person_id
    fill_in "Phone", with: @financial_responsible.phone
    click_on "Update Financial responsible"

    assert_text "Financial responsible was successfully updated"
    click_on "Back"
  end

  test "destroying a Financial responsible" do
    visit financial_responsibles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Financial responsible was successfully destroyed"
  end
end
