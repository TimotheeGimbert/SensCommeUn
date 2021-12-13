require "application_system_test_case"

class VisitorMessagesTest < ApplicationSystemTestCase
  setup do
    @visitor_message = visitor_messages(:one)
  end

  test "visiting the index" do
    visit visitor_messages_url
    assert_selector "h1", text: "Visitor Messages"
  end

  test "creating a Visitor message" do
    visit visitor_messages_url
    click_on "New Visitor Message"

    fill_in "Email", with: @visitor_message.email
    fill_in "Message", with: @visitor_message.message
    click_on "Create Visitor message"

    assert_text "Visitor message was successfully created"
    click_on "Back"
  end

  test "updating a Visitor message" do
    visit visitor_messages_url
    click_on "Edit", match: :first

    fill_in "Email", with: @visitor_message.email
    fill_in "Message", with: @visitor_message.message
    click_on "Update Visitor message"

    assert_text "Visitor message was successfully updated"
    click_on "Back"
  end

  test "destroying a Visitor message" do
    visit visitor_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Visitor message was successfully destroyed"
  end
end
