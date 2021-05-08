# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'index' do
    it 'returns a successful request' do
      get '/users'
      expect(response).to have_http_status(:ok)
    end

    it 'renders index view' do
      get '/users'
      expect(response).to render_template(:index)
    end
  end

  describe 'show' do
    it 'returns a successful request' do
      get '/users/me'
      expect(response).to have_http_status(:found)
    end
  end
end
