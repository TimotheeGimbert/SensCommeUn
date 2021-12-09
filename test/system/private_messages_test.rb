require "application_system_test_case"

class PrivateMessagesTest < ApplicationSystemTestCase
  setup do
    @private_message = private_messages(:one)
  end

  test "visiting the index" do
    visit private_messages_url
    assert_selector "h1", text: "Private Messages"
  end

  test "creating a Private message" do
    visit private_messages_url
    click_on "New Private Message"

    fill_in "Author", with: @private_message.author_id
    fill_in "Author type", with: @private_message.author_type
    fill_in "Content", with: @private_message.content
    fill_in "Object", with: @private_message.object
    click_on "Create Private message"

    assert_text "Private message was successfully created"
    click_on "Back"
  end

  test "updating a Private message" do
    visit private_messages_url
    click_on "Edit", match: :first

    fill_in "Author", with: @private_message.author_id
    fill_in "Author type", with: @private_message.author_type
    fill_in "Content", with: @private_message.content
    fill_in "Object", with: @private_message.object
    click_on "Update Private message"

    assert_text "Private message was successfully updated"
    click_on "Back"
  end

  test "destroying a Private message" do
    visit private_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Private message was successfully destroyed"
  end
end
