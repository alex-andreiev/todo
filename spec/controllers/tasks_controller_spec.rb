# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let!(:todo) { create(:todo) }
  let!(:task) { create(:task, todo_id: todo.id) }
  let!(:tasks) { create_list(:task, 10, todo_id: todo.id) }
  let!(:task_valid_attributes) { attributes_for(:task, todo_id: todo.id) }

  describe '#new' do
    before { get :new, params: { todo_id: todo.id }, xhr: true }

    it { is_expected.to render_template 'new' }
  end

  describe '#create' do
    let(:params) { { todo_id: todo.id, task: task_valid_attributes } }

    subject { post :create, params: params, xhr: true }

    it { is_expected.to redirect_to todo_path(todo) }
    it { expect { subject }.to change(Task, :count).by(1) }
  end

  describe '#edit' do
    before { get :edit, params: { todo_id: todo.id, id: task.id }, xhr: true }

    it { is_expected.to render_template 'edit' }
  end

  describe '#update' do
    let!(:text) { Faker::Lorem.sentence }
    let(:params) { { todo_id: todo.id, id: task.id, task: { task: text } } }

    subject { patch :update, params: params }

    it { is_expected.to redirect_to todo_path(todo) }
    it { expect { subject }.to change { task.reload.task }.from(task.task).to(text) }
  end

  describe '#destroy' do
    let(:params) { { todo_id: todo.id, id: task.id } }

    before { delete :destroy, params: params, xhr: true }

    it { is_expected.to redirect_to todo_path(todo) }
    it { expect(Task.count).to eq 10 }
  end
end
