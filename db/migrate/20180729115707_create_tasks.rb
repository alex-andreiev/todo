class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task
      t.boolean :completed_at, default: :false
      t.references :todo, index: true, foreign_key: true

      t.timestamps
    end
  end
end
