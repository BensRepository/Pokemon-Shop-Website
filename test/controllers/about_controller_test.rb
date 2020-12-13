require 'test_helper'

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get about_url
    assert_response :success
    assert_select 'title','About'
    assert_select 'p','PokeBen was founded in November 2020 by a Computer Science'
    assert_select 'p','Student named Ben Hodges. It was developed for his web application'
    assert_select 'p','coursework but has since vent viral, allowing fellow lovers of the game'
    assert_select 'p','to have a reliable platform to both chat and track desired Pokemon products.'
  end
end
