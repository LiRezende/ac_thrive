require 'test_helper'

class FinancialResponsiblesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @financial_responsible = financial_responsibles(:one)
  end

  test "should get index" do
    get financial_responsibles_url
    assert_response :success
  end

  test "should get new" do
    get new_financial_responsible_url
    assert_response :success
  end

  test "should create financial_responsible" do
    assert_difference('FinancialResponsible.count') do
      post financial_responsibles_url, params: { financial_responsible: { cpf: @financial_responsible.cpf, email: @financial_responsible.email, first_name: @financial_responsible.first_name, last_name: @financial_responsible.last_name, person_id: @financial_responsible.person_id, phone: @financial_responsible.phone } }
    end

    assert_redirected_to financial_responsible_url(FinancialResponsible.last)
  end

  test "should show financial_responsible" do
    get financial_responsible_url(@financial_responsible)
    assert_response :success
  end

  test "should get edit" do
    get edit_financial_responsible_url(@financial_responsible)
    assert_response :success
  end

  test "should update financial_responsible" do
    patch financial_responsible_url(@financial_responsible), params: { financial_responsible: { cpf: @financial_responsible.cpf, email: @financial_responsible.email, first_name: @financial_responsible.first_name, last_name: @financial_responsible.last_name, person_id: @financial_responsible.person_id, phone: @financial_responsible.phone } }
    assert_redirected_to financial_responsible_url(@financial_responsible)
  end

  test "should destroy financial_responsible" do
    assert_difference('FinancialResponsible.count', -1) do
      delete financial_responsible_url(@financial_responsible)
    end

    assert_redirected_to financial_responsibles_url
  end
end
