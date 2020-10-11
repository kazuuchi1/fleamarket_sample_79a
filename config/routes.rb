Rails.application.routes.draw do
  root 'items#index'
  # root 'buyers#new'
  resources :buyers, only: [:new, :create]
end
