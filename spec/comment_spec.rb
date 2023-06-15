require_relative 'rails_helper'
require_relative '../app/models/user'
require_relative '../app/models/post'
require_relative '../app/models/comment'

RSpec.describe Comment, type: :model do
  let(:author) { User.create(name: 'Mike Tyson', photo: 'https://pics.goog.com/2.jpg', bio: 'A humble human') }
  let(:post) { Post.create(author:, title: 'First Post', text: 'This is my first post') }
  subject { Comment.new(user: author,post:post, text:'Love it')}

  before { subject.save }


  context 'methods' do
    it 'should correctly update the comments_count for a given post' do

      comments_count = Comment.update_comments_counter(post)

      expect(comments_count).to eq 1
    end
  end
end