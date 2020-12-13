class ProductToTracker < ApplicationRecord
  belongs_to :product
  belongs_to :tracker
  validates_presence_of  :product,:tracker
end
