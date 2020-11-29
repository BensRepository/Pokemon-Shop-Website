class ProductToTracker < ApplicationRecord
  belongs_to :product
  belongs_to :tracker
end
