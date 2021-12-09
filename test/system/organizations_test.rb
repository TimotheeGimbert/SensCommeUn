require "application_system_test_case"

class OrganizationsTest < ApplicationSystemTestCase
  setup do
    @organization = organizations(:one)
  end

  test "visiting the index" do
    visit organizations_url
    assert_selector "h1", text: "Organizations"
  end

  test "creating a Organization" do
    visit organizations_url
    click_on "New Organization"

    fill_in "Activity sector", with: @organization.activity_sector_id
    fill_in "Address", with: @organization.address
    fill_in "Address complement", with: @organization.address_complement
    fill_in "City", with: @organization.city_id
    fill_in "Creation date", with: @organization.creation_date
    fill_in "Description", with: @organization.description
    fill_in "Email", with: @organization.email
    fill_in "Logo url", with: @organization.logo_url
    fill_in "Naf ape", with: @organization.naf_ape
    fill_in "Name", with: @organization.name
    fill_in "Nickname", with: @organization.nickname
    fill_in "Phone number", with: @organization.phone_number
    fill_in "Siren", with: @organization.siren
    fill_in "Status", with: @organization.status_id
    fill_in "Website url", with: @organization.website_url
    fill_in "Zip code", with: @organization.zip_code
    click_on "Create Organization"

    assert_text "Organization was successfully created"
    click_on "Back"
  end

  test "updating a Organization" do
    visit organizations_url
    click_on "Edit", match: :first

    fill_in "Activity sector", with: @organization.activity_sector_id
    fill_in "Address", with: @organization.address
    fill_in "Address complement", with: @organization.address_complement
    fill_in "City", with: @organization.city_id
    fill_in "Creation date", with: @organization.creation_date
    fill_in "Description", with: @organization.description
    fill_in "Email", with: @organization.email
    fill_in "Logo url", with: @organization.logo_url
    fill_in "Naf ape", with: @organization.naf_ape
    fill_in "Name", with: @organization.name
    fill_in "Nickname", with: @organization.nickname
    fill_in "Phone number", with: @organization.phone_number
    fill_in "Siren", with: @organization.siren
    fill_in "Status", with: @organization.status_id
    fill_in "Website url", with: @organization.website_url
    fill_in "Zip code", with: @organization.zip_code
    click_on "Update Organization"

    assert_text "Organization was successfully updated"
    click_on "Back"
  end

  test "destroying a Organization" do
    visit organizations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Organization was successfully destroyed"
  end
end
