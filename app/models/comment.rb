class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_comments_counter(target_post)
    count = where(post: target_post).count
    post.comments_counter = count
  end
end
