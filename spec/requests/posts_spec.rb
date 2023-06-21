require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    let(:user) {User.create(name:"Mike Tyson")}
    let(:post) {Post.create(title:"Post",text:"First Post",author:user)}

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
      expect(assigns(:posts).size).to be(1)
    end
  end

  # describe 'GET /show' do
  #   let(:user) { User.create(name: 'Mike Tyson') }
  #   before { get "/users/#{user.id}" }

  #   it 'should return ok response' do
  #     expect(response).to be_successful
  #     expect(response.status).to eq(200)
  #   end

  #   it 'should render the right template' do
  #     expect(response).to render_template(:show)
  #     expect(response).to render_template('show')
  #     expect(response).to render_template('users/show')
  #   end

  #   it 'should return the a specific user' do
  #     expect(assigns(:user)).to eq(user)
  #   end
  # end
end