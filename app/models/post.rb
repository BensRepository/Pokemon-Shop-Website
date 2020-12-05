class Post < ApplicationRecord
  validates_presence_of  :title,  :content,  :date,  :author
  has_many:comments, dependent: :destroy
  validates_length_of:title, maximum: 30
  belongs_to  :user
  scope :user_posts, ->(user) { where(['user_id = ?', user.id]) }
  def self.search_by(search_term)
    where("LOWER(title) LIKE :search_term OR LOWER(author) LIKE :search_term OR LOWER(date) LIKE :search_term", search_term: "%#{search_term.downcase}")
  end
end
