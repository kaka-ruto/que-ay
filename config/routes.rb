Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions
  resources :results, only: [:new, :create, :index]
end
