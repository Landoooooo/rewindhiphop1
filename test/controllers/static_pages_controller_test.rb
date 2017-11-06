require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get tapes" do
    get static_pages_tapes_url
    assert_response :success
  end

  test "should get user" do
    get static_pages_user_url
    assert_response :success
  end

end
