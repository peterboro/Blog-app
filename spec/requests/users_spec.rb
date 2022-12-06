require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      get '/users/:id'
      expect(response).to have_http_status(:success)
    end

    it 'should include correct placeholder' do
      get '/users/:id'
      expect(response.body).to include('Here are the users')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/:id'
      expect(response).to have_http_status(:success)
    end

    it 'should include correct placeholder' do
      get '/users/:id'
      expect(response.body).to include('Here is the user')
    end
  end
end
