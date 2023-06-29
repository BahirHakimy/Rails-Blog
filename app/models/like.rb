# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter
    count = Like.where(post:).count
    post.likes_counter = count
    post.save
  end
end
