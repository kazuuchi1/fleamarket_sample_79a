Rails.application.routes.draw do
  # root 'items#index'
  # root 'buyers#new'
  root 'mypages#show'
  resources :mypages, only: [:show] do
    collection do
      get 'logout'
    end
  end
  resources :cards, only: [:index]
  resources :buyers, only: [:new, :create]
end
