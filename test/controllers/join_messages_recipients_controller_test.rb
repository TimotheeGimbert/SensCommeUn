require "test_helper"

class JoinMessagesRecipientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_messages_recipient = join_messages_recipients(:one)
  end

  test "should get index" do
    get join_messages_recipients_url
    assert_response :success
  end

  test "should get new" do
    get new_join_messages_recipient_url
    assert_response :success
  end

  test "should create join_messages_recipient" do
    assert_difference('JoinMessagesRecipient.count') do
      post join_messages_recipients_url, params: { join_messages_recipient: { private_message_id: @join_messages_recipient.private_message_id, recipient_id: @join_messages_recipient.recipient_id, recipient_type: @join_messages_recipient.recipient_type } }
    end

    assert_redirected_to join_messages_recipient_url(JoinMessagesRecipient.last)
  end

  test "should show join_messages_recipient" do
    get join_messages_recipient_url(@join_messages_recipient)
    assert_response :success
  end

  test "should get edit" do
    get edit_join_messages_recipient_url(@join_messages_recipient)
    assert_response :success
  end

  test "should update join_messages_recipient" do
    patch join_messages_recipient_url(@join_messages_recipient), params: { join_messages_recipient: { private_message_id: @join_messages_recipient.private_message_id, recipient_id: @join_messages_recipient.recipient_id, recipient_type: @join_messages_recipient.recipient_type } }
    assert_redirected_to join_messages_recipient_url(@join_messages_recipient)
  end

  test "should destroy join_messages_recipient" do
    assert_difference('JoinMessagesRecipient.count', -1) do
      delete join_messages_recipient_url(@join_messages_recipient)
    end

    assert_redirected_to join_messages_recipients_url
  end
end
