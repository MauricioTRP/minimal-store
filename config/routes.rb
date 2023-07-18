Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :products
  root 'home#index'
  devise_for :users

  # session handling on test environment
  if Rails.env.test?
    namespace :test do
      resource :session, only: %i[create]
    end
  end
end
