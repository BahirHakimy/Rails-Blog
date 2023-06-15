require_relative 'rails_helper'
require_relative '../app/models/user'
require_relative '../app/models/post'
require_relative '../app/models/like'

RSpec.describe Like, type: :model do
  let(:author) { User.create(name: 'Mike Tyson', photo: 'https://pics.goog.com/2.jpg', bio: 'A humble human') }
  let(:post) { Post.create(author:, title: 'First Post', text: 'This is my first post') }
  subject { Like.new(user: author,post:post)}

  before { subject.save }


  context 'methods' do
    it 'should correctly update the likes_counter for a given post' do

      likes_count = Like.update_likes_counter(post)

      expect(likes_count).to eq 1
    end
  end
end