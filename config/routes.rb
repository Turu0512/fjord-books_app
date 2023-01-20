Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :books
  resources :users, only: %i(index show)
  root to: 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
