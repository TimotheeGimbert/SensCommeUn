require "application_system_test_case"

class StakeholderCategoriesTest < ApplicationSystemTestCase
  setup do
    @stakeholder_category = stakeholder_categories(:one)
  end

  test "visiting the index" do
    visit stakeholder_categories_url
    assert_selector "h1", text: "Stakeholder Categories"
  end

  test "creating a Stakeholder category" do
    visit stakeholder_categories_url
    click_on "New Stakeholder Category"

    fill_in "Name", with: @stakeholder_category.name
    click_on "Create Stakeholder category"

    assert_text "Stakeholder category was successfully created"
    click_on "Back"
  end

  test "updating a Stakeholder category" do
    visit stakeholder_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @stakeholder_category.name
    click_on "Update Stakeholder category"

    assert_text "Stakeholder category was successfully updated"
    click_on "Back"
  end

  test "destroying a Stakeholder category" do
    visit stakeholder_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stakeholder category was successfully destroyed"
  end
end
