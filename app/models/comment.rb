class Comment < ApplicationRecord
  belongs_to :post
  validates:comment, :post, presence: true
  validates_length_of:comment, maximum: 70, allow_blank: false
  belongs_to :user

  scope :user_comments, ->(user) { joins(:post).where(['user_id = ?', user.id]) }
end
