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
    assert_select 'h2','Desired Item Lists'
    assert_select 'h4','we have saved products you previously wanted!'
  end

end
