class Product < ApplicationRecord
  has_many :product_to_trackers, dependent: :destroy
  def self.search_by(search_term)
    where("LOWER(name) LIKE :search_term OR LOWER(collection) LIKE :search_term OR LOWER(category) LIKE :search_term", search_term: "%#{search_term.downcase}")
  end
end
