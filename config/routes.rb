Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  root to: 'questions#index'

  resources :questions
  resources :results, only: [:new, :create, :index]
  resources :users, only: [:new, :create]
end
