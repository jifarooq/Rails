Rails.application.routes.draw do
  root to: 'cats#index'
  
  resources :cats
  
  resources :cat_rental_requests, only: [:create, :destroy, :new] do
    member do
      patch 'approve'
      patch 'deny'
    end
  end
  
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
