class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  has_many :liked_by_users, through: :likes, source: :user

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.update_posts_counter(user)
    user_posts = where(author: user).count
    user.posts_counter = user_posts
  end

  def self.most_recent_comments(post)
    post.comments.order(created_at: :desc).limit(5)
  end
end
