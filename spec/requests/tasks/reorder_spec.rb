# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tasks::Reorders', type: :request do
  describe 'PATCH /todos/:todo_id/reorder_tasks' do
    it 'updates task positions in the submitted order' do
      user = FactoryBot.create(:user)
      todo = FactoryBot.create(:todo, user:)
      first = FactoryBot.create(:task, todo:, position: 1)
      second = FactoryBot.create(:task, todo:, position: 2)
      third = FactoryBot.create(:task, todo:, position: 3)
      Rails.application.reload_routes!
      sign_in user

      patch todo_reorder_tasks_path(todo), params: { ordered_ids: [second.id, third.id, first.id] }

      expect(response).to have_http_status(:no_content)
      expect(first.reload.position).to eq(3)
      expect(second.reload.position).to eq(1)
      expect(third.reload.position).to eq(2)
    end
  end
end
