require 'test_helper'

class ProductToTrackerTest < ActiveSupport::TestCase

  test 'should not create empty ProductToTracker' do
    Pttracker = ProductToTracker.new

    Pttracker.save
    refute Pttracker.valid?
  end

  test 'should  create  ProductToTracker' do
    Pttracker = ProductToTracker.new
    Pttracker.product = products(:one)
    Pttracker.tracker = trackers(:one)
    Pttracker.save
    assert Pttracker.valid?
  end

end
