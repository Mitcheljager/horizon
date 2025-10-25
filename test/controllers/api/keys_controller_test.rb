require "test_helper"

class Api::KeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_key = api_keys(:one)
  end

  test "should get index" do
    get api_keys_url, as: :json
    assert_response :success
  end

  test "should create api_key" do
    assert_difference("Api::Key.count") do
      post api_keys_url, params: { api_key: { identifier: @api_key.identifier, project_id: @api_key.project_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_key" do
    get api_key_url(@api_key), as: :json
    assert_response :success
  end

  test "should update api_key" do
    patch api_key_url(@api_key), params: { api_key: { identifier: @api_key.identifier, project_id: @api_key.project_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_key" do
    assert_difference("Api::Key.count", -1) do
      delete api_key_url(@api_key), as: :json
    end

    assert_response :no_content
  end
end
