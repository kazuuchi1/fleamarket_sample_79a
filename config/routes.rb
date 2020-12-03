Rails.application.routes.draw do

  devise_for :users
  root 'products#index'
  resources :mypages, only: [:show] do
    collection do
      get 'logout'
    end
  end
  # resources :product do
  #   collection do
  #     get 'category/get_category_children', to: 'prodacts#get_category_children', defaults: { format: 'json' }
  #     get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
  #   end
  # end
  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :cards, only: [:index]
 
  resources :buyers, only: [:new, :create]
  resources :products, only: [:index, :new, :show]
  resources :items, only: [:index]
end