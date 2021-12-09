require "application_system_test_case"

class ExternalStakeholdersTest < ApplicationSystemTestCase
  setup do
    @external_stakeholder = external_stakeholders(:one)
  end

  test "visiting the index" do
    visit external_stakeholders_url
    assert_selector "h1", text: "External Stakeholders"
  end

  test "creating a External stakeholder" do
    visit external_stakeholders_url
    click_on "New External Stakeholder"

    fill_in "Email", with: @external_stakeholder.email
    fill_in "Name", with: @external_stakeholder.name
    fill_in "Organization", with: @external_stakeholder.organization_id
    fill_in "Stakeholder category", with: @external_stakeholder.stakeholder_category_id
    click_on "Create External stakeholder"

    assert_text "External stakeholder was successfully created"
    click_on "Back"
  end

  test "updating a External stakeholder" do
    visit external_stakeholders_url
    click_on "Edit", match: :first

    fill_in "Email", with: @external_stakeholder.email
    fill_in "Name", with: @external_stakeholder.name
    fill_in "Organization", with: @external_stakeholder.organization_id
    fill_in "Stakeholder category", with: @external_stakeholder.stakeholder_category_id
    click_on "Update External stakeholder"

    assert_text "External stakeholder was successfully updated"
    click_on "Back"
  end

  test "destroying a External stakeholder" do
    visit external_stakeholders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "External stakeholder was successfully destroyed"
  end
end
