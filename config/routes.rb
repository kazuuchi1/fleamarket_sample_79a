Rails.application.routes.draw do

   root 'products#index'
  resources :buyers, only: [:new, :create]
end
