require "test_helper"

class VisitorMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @visitor_message = visitor_messages(:one)
  end

  test "should get index" do
    get visitor_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_visitor_message_url
    assert_response :success
  end

  test "should create visitor_message" do
    assert_difference('VisitorMessage.count') do
      post visitor_messages_url, params: { visitor_message: { email: @visitor_message.email, message: @visitor_message.message } }
    end

    assert_redirected_to visitor_message_url(VisitorMessage.last)
  end

  test "should show visitor_message" do
    get visitor_message_url(@visitor_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_visitor_message_url(@visitor_message)
    assert_response :success
  end

  test "should update visitor_message" do
    patch visitor_message_url(@visitor_message), params: { visitor_message: { email: @visitor_message.email, message: @visitor_message.message } }
    assert_redirected_to visitor_message_url(@visitor_message)
  end

  test "should destroy visitor_message" do
    assert_difference('VisitorMessage.count', -1) do
      delete visitor_message_url(@visitor_message)
    end

    assert_redirected_to visitor_messages_url
  end
end
