require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "shouldn't create empty comments" do
    comment = Comment.new
    comment.save
    refute comment.valid?
  end

  test "shouldn't create with empty messages" do
    comment = Comment.new

    comment.post = posts(:one)
    comment.user = users(:one)
    comment.message = ""
    comment.save
    refute comment.valid?
  end

  test "should create comment" do
    comment = Comment.new

    comment.post = posts(:one)
    comment.user = users(:one)
    comment.message = "Hello"
    comment.save
    assert comment.valid?
  end
  test "shouldn't create comment if message is too large" do
    comment = Comment.new

    comment.post = posts(:one)
    comment.user = users(:one)
    comment.message = "tesstttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt"
    comment.save
    refute comment.valid?
  end
end
