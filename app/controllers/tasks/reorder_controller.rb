# frozen_string_literal: true

module Tasks
  class ReorderController < ApplicationController
    def update
      todo = current_user.todos.find(params.expect(:todo_id))
      ordered_ids = params.expect(ordered_ids: [])
      position_offset = params.fetch(:position_offset, 0).to_i
      tasks = todo.tasks.where(id: ordered_ids)

      ActiveRecord::Base.transaction do
        ordered_ids.each_with_index do |id, index|
          task = tasks.detect { |item| item.id == id.to_i }
          task&.update!(position: position_offset + index + 1)
        end
      end

      head :no_content
    end
  end
end
