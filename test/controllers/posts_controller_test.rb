require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @post = posts(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
    assert_select 'h2','Trading Fourm'
    assert_select 'title','Trading Fourm'
    assert_select 'h4','The hub to submit any Pokemon news or trades'
  end

  test "should get user posts" do
    get userposts_url
    assert_response :success
    assert_select 'h2','Your Posts'
    assert_select 'title','Your Posts'

  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { author: @post.author, content: @post.content, date: @post.date, title: "title" } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should not go edit" do
    get edit_post_url(@post)
    assert_redirected_to posts_url()
  end

  test "should update post" do
    patch post_url(@post), params: { post: { author: @post.author, content: @post.content, date: @post.date, title: @post.title} }
    assert_response :success
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
