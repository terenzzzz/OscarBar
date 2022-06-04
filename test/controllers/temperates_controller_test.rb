require "test_helper"

class TemperatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temperate = temperates(:one)
  end

  test "should get index" do
    get temperates_url
    assert_response :success
  end

  test "should get new" do
    get new_temperate_url
    assert_response :success
  end

  test "should create temperate" do
    assert_difference('Temperate.count') do
      post temperates_url, params: { temperate: {  } }
    end

    assert_redirected_to temperate_url(Temperate.last)
  end

  test "should show temperate" do
    get temperate_url(@temperate)
    assert_response :success
  end

  test "should get edit" do
    get edit_temperate_url(@temperate)
    assert_response :success
  end

  test "should update temperate" do
    patch temperate_url(@temperate), params: { temperate: {  } }
    assert_redirected_to temperate_url(@temperate)
  end

  test "should destroy temperate" do
    assert_difference('Temperate.count', -1) do
      delete temperate_url(@temperate)
    end

    assert_redirected_to temperates_url
  end
end
