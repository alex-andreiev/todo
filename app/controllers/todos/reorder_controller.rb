# frozen_string_literal: true

module Todos
  class ReorderController < ApplicationController
    def update
      ordered_ids = params.expect(ordered_ids: [])
      position_offset = params.fetch(:position_offset, 0).to_i
      todos = current_user.todos.where(id: ordered_ids)

      ActiveRecord::Base.transaction do
        ordered_ids.each_with_index do |id, index|
          todo = todos.detect { |item| item.id == id.to_i }
          todo&.update!(position: position_offset + index + 1)
        end
      end

      head :no_content
    end
  end
end
