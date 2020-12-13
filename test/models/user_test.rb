require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "shouldn't save empty user" do
    user = User.new
    user.save
    refute user.valid?
  end

  test "should save user" do
    user = User.new
    user.email = "Ben@example.com"
    user.password = "secretpassword"
    user.save
    assert user.valid?
  end


end
