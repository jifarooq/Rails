Rails.application.routes.draw do
	root to: 'subs#index'

  resources :users, only: [:create, :new, :show, :index]
  resource :session, only: [:create, :new, :destroy]
  resources :subs, except: :destroy 

  resources :posts, except: :index do 
  	resources :comments, only: [:new]
  end

  resources :comments, only: [:create, :destroy]
end
