require "application_system_test_case"

class JoinMessagesRecipientsTest < ApplicationSystemTestCase
  setup do
    @join_messages_recipient = join_messages_recipients(:one)
  end

  test "visiting the index" do
    visit join_messages_recipients_url
    assert_selector "h1", text: "Join Messages Recipients"
  end

  test "creating a Join messages recipient" do
    visit join_messages_recipients_url
    click_on "New Join Messages Recipient"

    fill_in "Private message", with: @join_messages_recipient.private_message_id
    fill_in "Recipient", with: @join_messages_recipient.recipient_id
    fill_in "Recipient type", with: @join_messages_recipient.recipient_type
    click_on "Create Join messages recipient"

    assert_text "Join messages recipient was successfully created"
    click_on "Back"
  end

  test "updating a Join messages recipient" do
    visit join_messages_recipients_url
    click_on "Edit", match: :first

    fill_in "Private message", with: @join_messages_recipient.private_message_id
    fill_in "Recipient", with: @join_messages_recipient.recipient_id
    fill_in "Recipient type", with: @join_messages_recipient.recipient_type
    click_on "Update Join messages recipient"

    assert_text "Join messages recipient was successfully updated"
    click_on "Back"
  end

  test "destroying a Join messages recipient" do
    visit join_messages_recipients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Join messages recipient was successfully destroyed"
  end
end
