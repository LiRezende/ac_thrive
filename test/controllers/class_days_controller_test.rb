require 'test_helper'

class ClassDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_day = class_days(:one)
  end

  test "should get index" do
    get class_days_url
    assert_response :success
  end

  test "should get new" do
    get new_class_day_url
    assert_response :success
  end

  test "should create class_day" do
    assert_difference('ClassDay.count') do
      post class_days_url, params: { class_day: { name: @class_day.name } }
    end

    assert_redirected_to class_day_url(ClassDay.last)
  end

  test "should show class_day" do
    get class_day_url(@class_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_day_url(@class_day)
    assert_response :success
  end

  test "should update class_day" do
    patch class_day_url(@class_day), params: { class_day: { name: @class_day.name } }
    assert_redirected_to class_day_url(@class_day)
  end

  test "should destroy class_day" do
    assert_difference('ClassDay.count', -1) do
      delete class_day_url(@class_day)
    end

    assert_redirected_to class_days_url
  end
end
