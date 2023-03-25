Rails.application.routes.draw do
  devise_for :users
  root to: 'clients#index'
  resources :clients, only: [:index, :new, :create]
  resources :parts, only: [:index, :new, :create]
  resources :purchases, only: [:index, :new, :create]
  resources :sales, only: [:index,:new, :create]
  resources :stocks, only: [:index]
end
