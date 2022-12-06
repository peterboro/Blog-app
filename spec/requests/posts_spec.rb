require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/:user_id/posts/'
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end

    it 'should include correct placeholder' do
      get '/users/:user_id/posts/:id'
      expect(response.body).to include('Here are the posts for user')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end

    it 'should include correct placeholder' do
      get '/users/:user_id/posts/:id'
      expect(response.body).to include('Here is the post for user')
    end
  end
end
