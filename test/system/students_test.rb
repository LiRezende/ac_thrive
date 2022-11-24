require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "creating a Student" do
    visit students_url
    click_on "New Student"

    fill_in "Company", with: @student.company_id
    check "Financial responsible" if @student.financial_responsible
    fill_in "Idiom", with: @student.idiom_id
    fill_in "Idiom level", with: @student.idiom_level_id
    fill_in "Occupation", with: @student.occupation
    fill_in "Person", with: @student.person_id
    fill_in "Position", with: @student.position
    fill_in "Teacher", with: @student.teacher_id
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit students_url
    click_on "Edit", match: :first

    fill_in "Company", with: @student.company_id
    check "Financial responsible" if @student.financial_responsible
    fill_in "Idiom", with: @student.idiom_id
    fill_in "Idiom level", with: @student.idiom_level_id
    fill_in "Occupation", with: @student.occupation
    fill_in "Person", with: @student.person_id
    fill_in "Position", with: @student.position
    fill_in "Teacher", with: @student.teacher_id
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
