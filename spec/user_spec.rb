# frozen_string_literal: true

require_relative 'rails_helper'
require_relative '../app/models/user'
require_relative '../app/models/post'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Mike Tyson', photo: 'https://pics.goog.com/2.jpg', bio: 'A humble human', posts_counter: 0) }

  before { subject.save }
  context 'validations' do
    it 'should not be valid when name is blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'should not be valid when posts_counter is not a number' do
      subject.posts_counter = 'not a number'
      expect(subject).to_not be_valid
    end
    it 'should not be valid when posts_counter less than 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  context 'most_recent' do
    it 'returns the most recent 3 posts' do
      old_post = Post.create(title: 'Old Post', text: 'How are you', author: subject, created_at: 2.days.ago)
      new_post = Post.create(title: 'New Post', text: 'How are you', author: subject, created_at: 1.days.ago)
      recent_post = Post.create(title: 'Recent Post', text: 'How are you', author: subject, created_at: Time.current)

      most_recent_posts = subject.most_recent_posts

      expect(most_recent_posts).to eq([recent_post, new_post, old_post])
    end
  end
end
