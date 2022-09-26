class Post < ApplicationRecord
  belongs_to :user

  validates :title,length: {maximum: 35}, presence: true
  validates :body, presence: true
end
