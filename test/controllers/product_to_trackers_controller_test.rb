require 'test_helper'

class ProductToTrackersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @product_to_tracker = product_to_trackers(:one)
    sign_in users(:one)
  end


  test "should destroy product_to_tracker" do
    assert_difference('ProductToTracker.count', -1) do
      delete product_to_tracker_url(@product_to_tracker)
    end

    assert_redirected_to trackers_url
  end
end
