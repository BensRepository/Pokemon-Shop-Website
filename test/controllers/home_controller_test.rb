require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_select'title', 'My Notes'
    assert_select'h1', 'My Notes'
    assert_select'p', 'Welcome to my notes site!'
  end

end
