class Comment < ApplicationRecord
  belongs_to :post
  validates:message, :post, presence: true
  validates_length_of:message, maximum: 70, allow_blank: false
  belongs_to :user



end
