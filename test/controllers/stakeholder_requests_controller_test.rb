require "test_helper"

class StakeholderRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stakeholder_request = stakeholder_requests(:one)
  end

  test "should get index" do
    get stakeholder_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_stakeholder_request_url
    assert_response :success
  end

  test "should create stakeholder_request" do
    assert_difference('StakeholderRequest.count') do
      post stakeholder_requests_url, params: { stakeholder_request: { message: @stakeholder_request.message, organization_id: @stakeholder_request.organization_id, user_id: @stakeholder_request.user_id, validation: @stakeholder_request.validation } }
    end

    assert_redirected_to stakeholder_request_url(StakeholderRequest.last)
  end

  test "should show stakeholder_request" do
    get stakeholder_request_url(@stakeholder_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_stakeholder_request_url(@stakeholder_request)
    assert_response :success
  end

  test "should update stakeholder_request" do
    patch stakeholder_request_url(@stakeholder_request), params: { stakeholder_request: { message: @stakeholder_request.message, organization_id: @stakeholder_request.organization_id, user_id: @stakeholder_request.user_id, validation: @stakeholder_request.validation } }
    assert_redirected_to stakeholder_request_url(@stakeholder_request)
  end

  test "should destroy stakeholder_request" do
    assert_difference('StakeholderRequest.count', -1) do
      delete stakeholder_request_url(@stakeholder_request)
    end

    assert_redirected_to stakeholder_requests_url
  end
end
