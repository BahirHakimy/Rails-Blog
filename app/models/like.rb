class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_likes_counter(target_post)
    count = where(post: target_post).count
    target_post.likes_counter = count
  end
end
