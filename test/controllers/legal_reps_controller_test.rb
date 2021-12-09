require "test_helper"

class LegalRepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legal_rep = legal_reps(:one)
  end

  test "should get index" do
    get legal_reps_url
    assert_response :success
  end

  test "should get new" do
    get new_legal_rep_url
    assert_response :success
  end

  test "should create legal_rep" do
    assert_difference('LegalRep.count') do
      post legal_reps_url, params: { legal_rep: { end_date: @legal_rep.end_date, organization_id: @legal_rep.organization_id, start_date: @legal_rep.start_date, user_id: @legal_rep.user_id } }
    end

    assert_redirected_to legal_rep_url(LegalRep.last)
  end

  test "should show legal_rep" do
    get legal_rep_url(@legal_rep)
    assert_response :success
  end

  test "should get edit" do
    get edit_legal_rep_url(@legal_rep)
    assert_response :success
  end

  test "should update legal_rep" do
    patch legal_rep_url(@legal_rep), params: { legal_rep: { end_date: @legal_rep.end_date, organization_id: @legal_rep.organization_id, start_date: @legal_rep.start_date, user_id: @legal_rep.user_id } }
    assert_redirected_to legal_rep_url(@legal_rep)
  end

  test "should destroy legal_rep" do
    assert_difference('LegalRep.count', -1) do
      delete legal_rep_url(@legal_rep)
    end

    assert_redirected_to legal_reps_url
  end
end
