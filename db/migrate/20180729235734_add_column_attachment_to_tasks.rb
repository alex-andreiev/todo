# frozen_string_literal: true

class AddColumnAttachmentToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :attachment, :string
  end
end
