require "test_helper"

class Public::SubmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_submissions_new_url
    assert_response :success
  end

  test "should get index" do
    get public_submissions_index_url
    assert_response :success
  end

  test "should get show" do
    get public_submissions_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_submissions_edit_url
    assert_response :success
  end

  test "should get create" do
    get public_submissions_create_url
    assert_response :success
  end

  test "should get update" do
    get public_submissions_update_url
    assert_response :success
  end
end
