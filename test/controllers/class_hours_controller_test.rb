require 'test_helper'

class ClassHoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_hour = class_hours(:one)
  end

  test "should get index" do
    get class_hours_url
    assert_response :success
  end

  test "should get new" do
    get new_class_hour_url
    assert_response :success
  end

  test "should create class_hour" do
    assert_difference('ClassHour.count') do
      post class_hours_url, params: { class_hour: { class_day_id: @class_hour.class_day_id, description: @class_hour.description } }
    end

    assert_redirected_to class_hour_url(ClassHour.last)
  end

  test "should show class_hour" do
    get class_hour_url(@class_hour)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_hour_url(@class_hour)
    assert_response :success
  end

  test "should update class_hour" do
    patch class_hour_url(@class_hour), params: { class_hour: { class_day_id: @class_hour.class_day_id, description: @class_hour.description } }
    assert_redirected_to class_hour_url(@class_hour)
  end

  test "should destroy class_hour" do
    assert_difference('ClassHour.count', -1) do
      delete class_hour_url(@class_hour)
    end

    assert_redirected_to class_hours_url
  end
end
