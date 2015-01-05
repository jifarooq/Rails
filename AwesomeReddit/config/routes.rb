Rails.application.routes.draw do
	root to: 'subs#index'

  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  
  resources :subs, except: :destroy 
  resources :posts, except: :index

end
