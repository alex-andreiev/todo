require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  let!(:todo) { create(:todo) }
  let!(:todos) { create_list(:todo, 3) }
  let!(:todo_valid_params) { attributes_for(:todo) }
  let!(:tasks) { create_list(:task, 10, todo_id: todo.id) }

  describe '#index' do
    before { get :index }

    it { is_expected.to render_template 'index' }
    it { expect(assigns(:todos).count).to eq 4 }
  end

  describe '#show' do
    let!(:params) { { id: todo.id } }

    before { get :show, params: params }

    it { is_expected.to render_template 'show' }
    it { expect(assigns(:todo)).to eq todo}
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
end
