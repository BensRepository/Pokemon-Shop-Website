require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_select 'title', 'PokeBen'
    assert_select 'h3', 'Welcome to PokeBen! A place for you to relax, read community news and try .'
    assert_select 'h3', 'add new Pokemon products to your collection! have fun and catch them all!'
    assert_select 'h2', "Who's that Pokemon!"
    assert_select 'label',"Enter a guess:"
    assert_select'p', 'Look at the image below and try guess the Pokemon! See if you can guess it.'
  end
  test "should get contact" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'
    assert_select 'title', 'Contact us'
    assert_select 'label', 'Name:'
    assert_select 'label', 'Email:'
    assert_select 'label', 'Telephone:'
    assert_select 'label', 'Message:'
    assert_select 'h2', 'Contact us'
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
