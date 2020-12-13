class Post < ApplicationRecord
  validates_presence_of  :title,  :content,  :date,  :author
  has_many:comments, dependent: :destroy
  validates :title, uniqueness: true
  validates_length_of:title, maximum: 30
  validates_length_of:author, maximum: 20
  belongs_to  :user
  scope :user_posts, ->(user) { where(['user_id = ?', user.id]) } #scope method so user can only see their posts
  def self.search_by(search_term) #a model search to search by the search term inputted via the view sent via controller method
    where("LOWER(title) LIKE :search_term OR LOWER(author) LIKE :search_term OR LOWER(date) LIKE :search_term", search_term: "%#{search_term.downcase}")
  end #looks for matches within title, author and date
end
