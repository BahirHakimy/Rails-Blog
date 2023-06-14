class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  has_many :liked_by_users, through: :likes, source: :user

  def self.update_posts_counter(user)
    user_posts = where(author: user).count
    user.posts_counter = user_posts
  end

  def self.most_recent_comments(post)
    post.comments.order(created_at: :desc).limit(5)
  end
end
