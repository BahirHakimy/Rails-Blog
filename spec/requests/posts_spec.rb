require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'none' do
      expect(2).to eq(2)
    end
  end
end
