require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { is_expected.to validate_presence_of(:task) }
    it { is_expected.to validate_length_of(:task).is_at_most(300) }
  end

  describe 'association' do
    it { is_expected.to belong_to(:todo) }
  end
end
