require "application_system_test_case"

class LegalRepsTest < ApplicationSystemTestCase
  setup do
    @legal_rep = legal_reps(:one)
  end

  test "visiting the index" do
    visit legal_reps_url
    assert_selector "h1", text: "Legal Reps"
  end

  test "creating a Legal rep" do
    visit legal_reps_url
    click_on "New Legal Rep"

    fill_in "End date", with: @legal_rep.end_date
    fill_in "Organization", with: @legal_rep.organization_id
    fill_in "Start date", with: @legal_rep.start_date
    fill_in "User", with: @legal_rep.user_id
    click_on "Create Legal rep"

    assert_text "Legal rep was successfully created"
    click_on "Back"
  end

  test "updating a Legal rep" do
    visit legal_reps_url
    click_on "Edit", match: :first

    fill_in "End date", with: @legal_rep.end_date
    fill_in "Organization", with: @legal_rep.organization_id
    fill_in "Start date", with: @legal_rep.start_date
    fill_in "User", with: @legal_rep.user_id
    click_on "Update Legal rep"

    assert_text "Legal rep was successfully updated"
    click_on "Back"
  end

  test "destroying a Legal rep" do
    visit legal_reps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Legal rep was successfully destroyed"
  end
end
