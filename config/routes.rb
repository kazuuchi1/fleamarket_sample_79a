Rails.application.routes.draw do
  # get '/index'
  #root 'items#index'
  # root 'buyers#new'
   root 'products#index'
  resources :buyers, only: [:new, :create]
end
