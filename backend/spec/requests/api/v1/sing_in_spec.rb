require 'rails_helper'

RSpec.describe 'Sing in', type: :request do  
  describe 'GET /api/v1/login' do
    let!(:user) { User.create(id: 'Stive') }

    it "returns user’s access token" do
      post '/api/v1/login', params: { id: user.id }
      expect(user.token).to be_present
      expect(JSON.parse(response.body)).to eq({ 'token' => user.token })
    end
  end
end  
