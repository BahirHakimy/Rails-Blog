require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'Mike Tyson') }
  let(:post) { Post.create(title: 'Post', text: 'First Post', author: user) }
  describe 'GET /users/:user_id/posts' do
    before { get "/users/#{user.id}/posts" }
    it 'should return ok response' do
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'should render the right template' do
      expect(response).to render_template(:index)
      expect(response).to render_template('index')
      expect(response).to render_template('posts/index')
    end

    it 'should return the list of posts for a specific user' do
      expect(assigns(:user)).to eq(user)
      expect(assigns(:posts)).not_to be_nil
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before { get "/users/#{user.id}/posts/#{post.id}" }

    it 'should return ok response' do
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'should render the right template' do
      expect(response).to render_template(:show)
      expect(response).to render_template('show')
      expect(response).to render_template('posts/show')
    end

    it 'should return the a specific post' do
      expect(assigns(:user)).to eq(user)
      expect(assigns(:post)).to eq(post)
    end
  end
end
