Rails.application.routes.draw do
  root 'todos#index'
  resources :todos do
    resources :tasks
  end
end
