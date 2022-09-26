# frozen_string_literal: true

# Post, belongs_to user
class Post < ApplicationRecord
  belongs_to :user, counter_cache: true

  validates :title, length: { maximum: 35 }, presence: true
  validates :body, presence: true
end
