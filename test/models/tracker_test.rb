require 'test_helper'

class TrackerTest < ActiveSupport::TestCase
  test 'should create' do
    tracker = Tracker.new

    tracker.save
    assert tracker.valid?
  end
end
