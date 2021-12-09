require "test_helper"

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
  end

  test "should get index" do
    get organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_url
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post organizations_url, params: { organization: { activity_sector_id: @organization.activity_sector_id, address: @organization.address, address_complement: @organization.address_complement, city_id: @organization.city_id, creation_date: @organization.creation_date, description: @organization.description, email: @organization.email, logo_url: @organization.logo_url, naf_ape: @organization.naf_ape, name: @organization.name, nickname: @organization.nickname, phone_number: @organization.phone_number, siren: @organization.siren, status_id: @organization.status_id, website_url: @organization.website_url, zip_code: @organization.zip_code } }
    end

    assert_redirected_to organization_url(Organization.last)
  end

  test "should show organization" do
    get organization_url(@organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_url(@organization)
    assert_response :success
  end

  test "should update organization" do
    patch organization_url(@organization), params: { organization: { activity_sector_id: @organization.activity_sector_id, address: @organization.address, address_complement: @organization.address_complement, city_id: @organization.city_id, creation_date: @organization.creation_date, description: @organization.description, email: @organization.email, logo_url: @organization.logo_url, naf_ape: @organization.naf_ape, name: @organization.name, nickname: @organization.nickname, phone_number: @organization.phone_number, siren: @organization.siren, status_id: @organization.status_id, website_url: @organization.website_url, zip_code: @organization.zip_code } }
    assert_redirected_to organization_url(@organization)
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete organization_url(@organization)
    end

    assert_redirected_to organizations_url
  end
end
