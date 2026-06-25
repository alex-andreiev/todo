# frozen_string_literal: true

class AddColumnPriorityToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :priority, :integer, default: 0
  end
end
