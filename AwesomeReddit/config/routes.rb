Rails.application.routes.draw do
	root to: 'subs#index'

  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :subs, except: :destroy 

  resources :posts, except: :index do 
  	resources :comments, only: [:create]
  end

  # resources :comments, only: [:create, :destroy]

end
