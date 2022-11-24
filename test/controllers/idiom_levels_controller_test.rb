require 'test_helper'

class IdiomLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idiom_level = idiom_levels(:one)
  end

  test "should get index" do
    get idiom_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_idiom_level_url
    assert_response :success
  end

  test "should create idiom_level" do
    assert_difference('IdiomLevel.count') do
      post idiom_levels_url, params: { idiom_level: { idiom_id: @idiom_level.idiom_id, name: @idiom_level.name } }
    end

    assert_redirected_to idiom_level_url(IdiomLevel.last)
  end

  test "should show idiom_level" do
    get idiom_level_url(@idiom_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_idiom_level_url(@idiom_level)
    assert_response :success
  end

  test "should update idiom_level" do
    patch idiom_level_url(@idiom_level), params: { idiom_level: { idiom_id: @idiom_level.idiom_id, name: @idiom_level.name } }
    assert_redirected_to idiom_level_url(@idiom_level)
  end

  test "should destroy idiom_level" do
    assert_difference('IdiomLevel.count', -1) do
      delete idiom_level_url(@idiom_level)
    end

    assert_redirected_to idiom_levels_url
  end
end
