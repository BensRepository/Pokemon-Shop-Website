require 'test_helper'

class ProductToTrackersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_to_tracker = product_to_trackers(:one)
  end

  test "should get index" do
    get product_to_trackers_url
    assert_response :success
  end

  test "should get new" do
    get new_product_to_tracker_url
    assert_response :success
  end

  test "should create product_to_tracker" do
    assert_difference('ProductToTracker.count') do
      post product_to_trackers_url, params: { product_to_tracker: { product_id: @product_to_tracker.product_id, tracker_id: @product_to_tracker.tracker_id } }
    end

    assert_redirected_to product_to_tracker_url(ProductToTracker.last)
  end

  test "should show product_to_tracker" do
    get product_to_tracker_url(@product_to_tracker)
    assert_response :success
  end

  test "should destroy product_to_tracker" do
    assert_difference('ProductToTracker.count', -1) do
      delete product_to_tracker_url(@product_to_tracker)
    end

    assert_redirected_to product_to_trackers_url
  end
end
