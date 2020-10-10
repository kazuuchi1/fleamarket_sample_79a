Rails.application.routes.draw do
  root 'buyers#new'
  # root 'items#index'
  resources :buyers, only: [:new, :create]
end
