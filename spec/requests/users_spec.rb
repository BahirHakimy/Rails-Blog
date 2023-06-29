require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before { get '/users' }
    it 'should return ok response' do
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'should render the right template' do
      expect(response).to render_template(:index)
      expect(response).to render_template('index')
      expect(response).to render_template('users/index')
    end

    it 'should return the list of users' do
      expect(assigns(:users)).not_to be_nil
    end
  end

  describe 'GET /users/:id' do
    let(:user) { User.create(name: 'Mike Tyson') }
    before { get "/users/#{user.id}" }

    it 'should return ok response' do
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'should render the right template' do
      expect(response).to render_template(:show)
      expect(response).to render_template('show')
      expect(response).to render_template('users/show')
    end

    it 'should return the a specific user' do
      expect(assigns(:user)).to eq(user)
    end
  end
end
