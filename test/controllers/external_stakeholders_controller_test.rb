require "test_helper"

class ExternalStakeholdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @external_stakeholder = external_stakeholders(:one)
  end

  test "should get index" do
    get external_stakeholders_url
    assert_response :success
  end

  test "should get new" do
    get new_external_stakeholder_url
    assert_response :success
  end

  test "should create external_stakeholder" do
    assert_difference('ExternalStakeholder.count') do
      post external_stakeholders_url, params: { external_stakeholder: { email: @external_stakeholder.email, name: @external_stakeholder.name, organization_id: @external_stakeholder.organization_id, stakeholder_category_id: @external_stakeholder.stakeholder_category_id } }
    end

    assert_redirected_to external_stakeholder_url(ExternalStakeholder.last)
  end

  test "should show external_stakeholder" do
    get external_stakeholder_url(@external_stakeholder)
    assert_response :success
  end

  test "should get edit" do
    get edit_external_stakeholder_url(@external_stakeholder)
    assert_response :success
  end

  test "should update external_stakeholder" do
    patch external_stakeholder_url(@external_stakeholder), params: { external_stakeholder: { email: @external_stakeholder.email, name: @external_stakeholder.name, organization_id: @external_stakeholder.organization_id, stakeholder_category_id: @external_stakeholder.stakeholder_category_id } }
    assert_redirected_to external_stakeholder_url(@external_stakeholder)
  end

  test "should destroy external_stakeholder" do
    assert_difference('ExternalStakeholder.count', -1) do
      delete external_stakeholder_url(@external_stakeholder)
    end

    assert_redirected_to external_stakeholders_url
  end
end
