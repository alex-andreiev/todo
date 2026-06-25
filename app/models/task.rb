# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :todo

  before_validation :assign_position, on: :create

  validates :task, presence: true, length: { maximum: 300 }

  mount_uploader :attachment, AttachmentUploader

  enum :priority, { whenever: 0, low: 1, medium: 2, high: 3, immediate: 4 }

  private

  def assign_position
    return unless todo

    self.position ||= (todo.tasks.maximum(:position) || 0) + 1
  end
end
