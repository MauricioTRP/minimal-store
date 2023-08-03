Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  resources :products do
    member do
      get 'preview'
    end
  end
  root 'home#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
