Rails.application.routes.draw do
  devise_for :users
  root to: 'clients#index'
  resources :clients, only: [:index, :new, :create]
  resources :parts, only: [:new, :create]
end
