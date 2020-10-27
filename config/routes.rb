Rails.application.routes.draw do
  get 'top/index'
  #root 'items#index'
  # root 'buyers#new'
   root 'top#index'
  resources :buyers, only: [:new, :create]
end
