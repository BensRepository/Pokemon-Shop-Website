require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    puts @response.body
    assert_select 'title', 'PokeBen'

  end
  test "should get contact" do
  get contact_url
  assert_response :success
  assert_template layout: 'application'
  assert_select 'title', 'Contact us'
  assert_select 'h1', 'Contact us'
  assert_select 'p', 'if you have any queries please fill in this form and get in touch with us.'
  end

  test "should post request contact" do
  post request_contact_url, params:
  {name: "Matthew", email: "matthew@me.com",
  telephone: "1234567890", message: "Hello"}
  assert_response :redirect
  assert_nil flash[:alert]
  assert_not_empty flash[:notice]
  end


end
