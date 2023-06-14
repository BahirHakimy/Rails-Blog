class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_likes_counter(post)
    count = Like.where(post: post).count
    post.likes_counter = count
  end
end
