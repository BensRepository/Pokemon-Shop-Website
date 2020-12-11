require 'test_helper'

class TrackersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @tracker = trackers(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get trackers_url
    assert_response :success
  end


  test "should create tracker" do
    assert_difference('Tracker.count') do
      post trackers_url, params: { tracker: {  } }
    end

    assert_redirected_to tracker_url(Tracker.last)
  end

  test "should show tracker" do
    get tracker_url(@tracker)
    assert_response :success
  end

  test "should get edit" do
    get edit_tracker_url(@tracker)
    assert_response :success
  end

  test "should update tracker" do
    patch tracker_url(@tracker), params: { tracker: {  } }
    assert_redirected_to tracker_url(@tracker)
  end

  test "should destroy tracker" do
    assert_difference('Tracker.count', -1) do
      delete tracker_url(@tracker)
    end

    assert_redirected_to trackers_url
  end
end
