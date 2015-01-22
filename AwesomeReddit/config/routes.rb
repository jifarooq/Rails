Rails.application.routes.draw do
	root to: 'subs#index'

  resources :users, only: [:create, :new, :show, :index]
  resource :session, only: [:create, :new, :destroy]
  resources :subs, except: :destroy do
  	member do
  		post "downvote"
  		post "upvote"
  	end
  end

  resources :posts, except: :index do 
  	resources :comments, only: [:new]
  	member do
  		post "downvote"
  		post "upvote"
  	end
  end

  resources :comments, only: [:create, :destroy, :show]
end
