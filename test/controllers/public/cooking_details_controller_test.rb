require "test_helper"

class Public::CookingDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_cooking_details_new_url
    assert_response :success
  end

  test "should get create" do
    get public_cooking_details_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_cooking_details_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_cooking_details_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_cooking_details_destroy_url
    assert_response :success
  end
end
