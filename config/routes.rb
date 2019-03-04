Rails.application.routes.draw do
  devise_for :accounts
  resources :orders
  root 'store#index', as: 'store_index'
  resources :line_items do
    member do
      patch "decrement"
    end
  end
  resources :carts
  resources :products
  get 'search', to: 'store#search'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
