class Post < ApplicationRecord
  validates_presence_of  :title,  :content,  :date,  :author
  has_many:comments, dependent: :destroy
  validates_length_of:title, maximum: 30
  belongs_to  :user
  scope :user_posts, ->(user) { where(['user_id = ?', user.id]) }
end
