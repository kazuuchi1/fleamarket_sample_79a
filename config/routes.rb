Rails.application.routes.draw do
  root 'items#index'
  resources :buyers, only: [:new, :create]
  resources :products, only: [:show]
end