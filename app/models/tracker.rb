class Tracker < ApplicationRecord
  has_many :product_to_trackers, dependent: :destroy
end
