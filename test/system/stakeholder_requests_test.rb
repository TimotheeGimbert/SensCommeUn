require "application_system_test_case"

class StakeholderRequestsTest < ApplicationSystemTestCase
  setup do
    @stakeholder_request = stakeholder_requests(:one)
  end

  test "visiting the index" do
    visit stakeholder_requests_url
    assert_selector "h1", text: "Stakeholder Requests"
  end

  test "creating a Stakeholder request" do
    visit stakeholder_requests_url
    click_on "New Stakeholder Request"

    fill_in "Message", with: @stakeholder_request.message
    fill_in "Organization", with: @stakeholder_request.organization_id
    fill_in "User", with: @stakeholder_request.user_id
    check "Validation" if @stakeholder_request.validation
    click_on "Create Stakeholder request"

    assert_text "Stakeholder request was successfully created"
    click_on "Back"
  end

  test "updating a Stakeholder request" do
    visit stakeholder_requests_url
    click_on "Edit", match: :first

    fill_in "Message", with: @stakeholder_request.message
    fill_in "Organization", with: @stakeholder_request.organization_id
    fill_in "User", with: @stakeholder_request.user_id
    check "Validation" if @stakeholder_request.validation
    click_on "Update Stakeholder request"

    assert_text "Stakeholder request was successfully updated"
    click_on "Back"
  end

  test "destroying a Stakeholder request" do
    visit stakeholder_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stakeholder request was successfully destroyed"
  end
end
