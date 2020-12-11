require 'test_helper'

class ProductToTrackersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @product_to_tracker = product_to_trackers(:one)
    sign_in users(:one)
  end


  test "should create product_to_tracker" do
    assert_difference('ProductToTracker.count') do
      post product_to_trackers_url, params: { product_to_tracker: { product_id: @product_to_tracker.product_id, tracker_id: @product_to_tracker.tracker_id } }
    end

    assert_redirected_to product_to_tracker_url(ProductToTracker.last)
  end


  test "should destroy product_to_tracker" do
    assert_difference('ProductToTracker.count', -1) do
      delete product_to_tracker_url(@product_to_tracker)
    end

    assert_redirected_to :back
  end
end
