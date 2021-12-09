require "application_system_test_case"

class ActivitySectorsTest < ApplicationSystemTestCase
  setup do
    @activity_sector = activity_sectors(:one)
  end

  test "visiting the index" do
    visit activity_sectors_url
    assert_selector "h1", text: "Activity Sectors"
  end

  test "creating a Activity sector" do
    visit activity_sectors_url
    click_on "New Activity Sector"

    fill_in "Name", with: @activity_sector.name
    click_on "Create Activity sector"

    assert_text "Activity sector was successfully created"
    click_on "Back"
  end

  test "updating a Activity sector" do
    visit activity_sectors_url
    click_on "Edit", match: :first

    fill_in "Name", with: @activity_sector.name
    click_on "Update Activity sector"

    assert_text "Activity sector was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity sector" do
    visit activity_sectors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity sector was successfully destroyed"
  end
end
