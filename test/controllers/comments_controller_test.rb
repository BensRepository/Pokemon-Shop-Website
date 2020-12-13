require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @comment = comments(:one)
    sign_in users(:one)

  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should get user comments" do
    get usercomments_url
    assert_response :success
    assert_select 'title','Your Comments'
    assert_select 'h2','Your Comments'
  end


  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { message: @comment.message, post_id: @comment.post_id } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
    assert_select 'h1','PokeBen'
  end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
    assert_select 'h1','Edit Comment'
    assert_select 'title','PokeBen'
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { message: @comment.message, post_id: @comment.post_id } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to @comment.post
  end
end
