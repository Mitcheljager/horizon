require "test_helper"

class Api::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_event = api_events(:one)
  end

  test "should get index" do
    get api_events_url, as: :json
    assert_response :success
  end

  test "should create api_event" do
    assert_difference("Api::Event.count") do
      post api_events_url, params: { api_event: { name: @api_event.name, project_id: @api_event.project_id, properties: @api_event.properties } }, as: :json
    end

    assert_response :created
  end

  test "should show api_event" do
    get api_event_url(@api_event), as: :json
    assert_response :success
  end

  test "should update api_event" do
    patch api_event_url(@api_event), params: { api_event: { name: @api_event.name, project_id: @api_event.project_id, properties: @api_event.properties } }, as: :json
    assert_response :success
  end

  test "should destroy api_event" do
    assert_difference("Api::Event.count", -1) do
      delete api_event_url(@api_event), as: :json
    end

    assert_response :no_content
  end
end
