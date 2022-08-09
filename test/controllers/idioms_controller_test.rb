require 'test_helper'

class IdiomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idiom = idioms(:one)
  end

  test "should get index" do
    get idioms_url
    assert_response :success
  end

  test "should get new" do
    get new_idiom_url
    assert_response :success
  end

  test "should create idiom" do
    assert_difference('Idiom.count') do
      post idioms_url, params: { idiom: { idiom_level: @idiom.idiom_level, idiom_name: @idiom.idiom_name } }
    end

    assert_redirected_to idiom_url(Idiom.last)
  end

  test "should show idiom" do
    get idiom_url(@idiom)
    assert_response :success
  end

  test "should get edit" do
    get edit_idiom_url(@idiom)
    assert_response :success
  end

  test "should update idiom" do
    patch idiom_url(@idiom), params: { idiom: { idiom_level: @idiom.idiom_level, idiom_name: @idiom.idiom_name } }
    assert_redirected_to idiom_url(@idiom)
  end

  test "should destroy idiom" do
    assert_difference('Idiom.count', -1) do
      delete idiom_url(@idiom)
    end

    assert_redirected_to idioms_url
  end
end
