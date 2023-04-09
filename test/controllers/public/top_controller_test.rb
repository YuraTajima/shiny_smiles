require "test_helper"

class Public::TopControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get public_top_about_url
    assert_response :success
  end
end
