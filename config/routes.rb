Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :todos do
    resources :tasks
  end
end
