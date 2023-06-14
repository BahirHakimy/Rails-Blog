class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_comments_counter(post)
    count = Comment.where(post).count
    post.comments_counter = count
  end
end
