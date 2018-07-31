# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  let!(:user) { create(:user) }
  let!(:todo) { create(:todo, user_id: user.id) }
  let!(:todos) { create_list(:todo, 3, user_id: user.id) }
  let!(:todo_valid_params) { attributes_for(:todo, user_id: user.id) }
  let!(:tasks) { create_list(:task, 10, todo_id: todo.id) }

  before do
    allow_any_instance_of(described_class).to receive(:current_user) {user}
    sign_in user
  end

  describe '#index' do
    before { get :index }

    it { is_expected.to render_template 'index' }
    it { expect(assigns(:todos).count).to eq 4 }
  end

  describe '#show' do
    let!(:params) { { id: todo.id } }

    before { get :show, params: params }

    it { is_expected.to render_template 'show' }
    it { expect(assigns(:todo)).to eq todo }
    it { expect(assigns(:tasks).count).to eq 10 }
  end

  describe '#new' do
    before { get :new, xhr: true }

    it { is_expected.to render_template 'new' }
  end

  describe '#create' do
    let!(:params) { { todo: todo_valid_params } }

    subject { post :create, params: params, xhr: true }

    it { is_expected.to redirect_to todo_path(Todo.last.id) }
    it { expect { subject }.to change(Todo, :count).by(1) }
  end

  describe '#edit' do
    let(:params) { { id: todo.id } }

    before { get :edit, params: params }

    it { is_expected.to render_template 'edit' }
  end

  describe '#update' do
    let(:title) { Faker::Lorem.sentence }
    let(:params) { { id: todo.id, todo: { title: title } } }

    subject { patch :update, params: params }

    it { is_expected.to redirect_to todos_path }
    it { expect { subject }.to change { todo.reload.title }.from(todo.title).to(title) }
  end

  describe '#destroy' do
    let(:params) { { id: todo.id } }

    subject { delete :destroy, params: params }

    it { is_expected.to redirect_to todos_path }
    it { expect { subject }.to change(Todo, :count).by(-1) }
    #it { expect(Task.count).to eq 10 }
  end
end
