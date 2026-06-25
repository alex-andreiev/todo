# frozen_string_literal: true

class Todo < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user

  before_validation :assign_position, on: :create

  validates :title, presence: true, length: { maximum: 50 }

  private

  def assign_position
    return unless user

    self.position ||= (user.todos.maximum(:position) || 0) + 1
  end
end
