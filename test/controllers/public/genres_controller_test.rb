require "test_helper"

class Public::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_genres_new_url
    assert_response :success
  end

  test "should get index" do
    get public_genres_index_url
    assert_response :success
  end

  test "should get show" do
    get public_genres_show_url
    assert_response :success
  end
end
