class Post < ApplicationRecord
  validates_presence_of  :title,  :content,  :date,  :author
  has_many:comments, dependent: :destroy
  validates_length_of:title, maximum: 30
end
