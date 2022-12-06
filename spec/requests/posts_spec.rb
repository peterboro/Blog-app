require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/posts/'
      expect(response).to have_http_status(:success)
    end

    it 'should include correct placeholder' do
      get '/posts/'
      expect(response.body).to include('Here are ALL Posts for a given user')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/posts/:id'
      expect(response).to have_http_status(:success)
    end

    it 'should include correct placeholder' do
      get '/posts/:id'
      expect(response.body).to include('Here is a single Post for a given user')
    end
  end
end
