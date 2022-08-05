require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rooms_index_url
    assert_response :success
  end

  test "should get new" do
    get rooms_new_url
    assert_response :success
  end

  test "should get create" do
    get rooms_create_url
    assert_response :success
  end

  test "should get image_upload" do
    get rooms_image_upload_url
    assert_response :success
  end

  test "should get update" do
    get rooms_update_url
    assert_response :success
  end
end
