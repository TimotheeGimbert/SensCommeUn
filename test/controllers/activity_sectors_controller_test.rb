require "test_helper"

class ActivitySectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_sector = activity_sectors(:one)
  end

  test "should get index" do
    get activity_sectors_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_sector_url
    assert_response :success
  end

  test "should create activity_sector" do
    assert_difference('ActivitySector.count') do
      post activity_sectors_url, params: { activity_sector: { name: @activity_sector.name } }
    end

    assert_redirected_to activity_sector_url(ActivitySector.last)
  end

  test "should show activity_sector" do
    get activity_sector_url(@activity_sector)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_sector_url(@activity_sector)
    assert_response :success
  end

  test "should update activity_sector" do
    patch activity_sector_url(@activity_sector), params: { activity_sector: { name: @activity_sector.name } }
    assert_redirected_to activity_sector_url(@activity_sector)
  end

  test "should destroy activity_sector" do
    assert_difference('ActivitySector.count', -1) do
      delete activity_sector_url(@activity_sector)
    end

    assert_redirected_to activity_sectors_url
  end
end
