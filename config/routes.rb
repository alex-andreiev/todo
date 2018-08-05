Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#index'
  devise_for :users
  resources :todos do
    resources :tasks
  end
  resources :locales, only: :update
end
