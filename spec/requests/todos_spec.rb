# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  describe 'GET /todos' do
    it 'renders the authenticated todo list' do
      user = FactoryBot.create(:user)
      FactoryBot.create(:todo, user:)
      Rails.application.reload_routes!
      sign_in user

      get todos_path

      expect(response).to have_http_status(:ok)
    end
  end
end
