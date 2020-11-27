class Comment < ApplicationRecord
  belongs_to :post
  validates:comment, :post, presence: true
  validates_length_of:comment, maximum: 30, allow_blank: false
end
