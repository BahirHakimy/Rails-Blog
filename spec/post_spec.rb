require_relative 'rails_helper'
require_relative '../app/models/user'
require_relative '../app/models/post'
require_relative '../app/models/comment'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'Mike Tyson', photo: 'https://pics.goog.com/2.jpg', bio: 'A humble human') }
  subject { Post.new(author:, title: 'First Post', text: 'This is my first post') }

  before { subject.save }

  context 'validations' do
    it 'should not be valid when title is blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'should not be valid when title length is more than 250' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end
    it 'should not be valid when comments_counter is not a number' do
      subject.comments_counter = 'not a number'
      expect(subject).to_not be_valid
    end
    it 'should not be valid when comments_counter less than 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end
    it 'should not be valid when likes_counter is not a number' do
      subject.likes_counter = 'not a number'
      expect(subject).to_not be_valid
    end
    it 'should not be valid when likes_counter less than 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  context 'methods' do
    it 'should correctly update the posts counter for a given user' do
      Post.create(title: 'New Post', text: 'How are you', author:)

      posts_counter = Post.update_posts_counter(author)

      expect(posts_counter).to eq 2
    end
    it 'should return 5 most recent commetns for a given post' do
      very_very_old_comment = Comment.create(user: author, post: subject, text: 'Love it', created_at: 4.days.ago)
      very_old_comment = Comment.create(user: author, post: subject, text: 'Love it', created_at: 3.days.ago)
      old_comment = Comment.create(user: author, post: subject, text: 'Love it', created_at: 2.days.ago)
      new_comment = Comment.create(user: author, post: subject, text: 'Love it', created_at: 1.days.ago)
      recent_comment = Comment.create(user: author, post: subject, text: 'Love it', created_at: Time.current)

      most_recent_comments = Post.most_recent_comments(subject)

      expect(most_recent_comments).to eq([recent_comment, new_comment, old_comment, very_old_comment,
                                          very_very_old_comment])
    end
  end
end
