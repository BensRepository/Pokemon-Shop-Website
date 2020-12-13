require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "should't save empty post" do
    post = Post.new

    post.save
    refute post.valid?
  end

  test 'should save post' do
    post = Post.new
    post.title = "my title"
    post.content = "this my post"
    post.author = "Ben"
    post.date = 2020-12-12
    post.user = users(:one)

    post.save
    assert post.valid?
  end

  test "shouldn't save long titles" do
    post = Post.new
    post.title = "testttttttttttttttttttttttttttt"
    post.content = "this my post"
    post.author = "Ben"
    post.date = 2020-12-12
    post.user = users(:one)

    post.save
    refute post.valid?
  end

  test "shouldn't save long authors" do
    post = Post.new
    post.title = "My post"
    post.content = "this my post"
    post.author = "testttttttttttttttttt"
    post.date = 2020-12-12
    post.user = users(:one)

    post.save
    refute post.valid?
  end

  test "shouldn't save with duplicate titles" do
    post1 = Post.new
    post1.title = "unique"
    post1.content = "this my post"
    post1.author = "Ben"
    post1.date = 2020-12-12
    post1.user = users(:one)
    assert post1.valid?

    post2 = Post.new
    post2.title  = "MyString"
    post2.content = "this my second post"
    post2.author = "Ben2"
    post2.date = 2020-12-12
    post2.user = users(:one)
    refute post2.valid?
  end

end
