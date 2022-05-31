require "test_helper"

class User1sControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user1s_index_url
    assert_response :success
  end

  test "should get show" do
    get user1s_show_url
    assert_response :success
  end

  test "should get new" do
    get user1s_new_url
    assert_response :success
  end

  test "should get edit" do
    get user1s_edit_url
    assert_response :success
  end
end
