class Product < ApplicationRecord
  has_many :product_to_trackers, dependent: :destroy
  validates:name, :category,:image, :collection, presence: true
  validates :image,:name, uniqueness: true
  def self.search_by(search_term) #a model search to search by the search term inputted via the view sent via controller method
    where("LOWER(name) LIKE :search_term OR LOWER(collection) LIKE :search_term OR LOWER(category) LIKE :search_term", search_term: "%#{search_term.downcase}")
  end
end
