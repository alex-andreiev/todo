# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :todos do
    collection do
      patch 'reorder', to: 'todos/reorder#update'
    end

    resources :tasks
    patch 'reorder_tasks', to: 'tasks/reorder#update'
  end
  resources :locales, only: :update
end
