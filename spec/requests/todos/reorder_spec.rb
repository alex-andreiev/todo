# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Todos::Reorders', type: :request do
  describe 'PATCH /todos/reorder' do
    it 'updates todo positions in the submitted order' do
      user = FactoryBot.create(:user)
      first = FactoryBot.create(:todo, user:, position: 1)
      second = FactoryBot.create(:todo, user:, position: 2)
      third = FactoryBot.create(:todo, user:, position: 3)
      Rails.application.reload_routes!
      sign_in user

      patch reorder_todos_path, params: { ordered_ids: [third.id, first.id, second.id] }

      expect(response).to have_http_status(:no_content)
      expect(first.reload.position).to eq(2)
      expect(second.reload.position).to eq(3)
      expect(third.reload.position).to eq(1)
    end
  end
end
