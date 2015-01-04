Rails.application.routes.draw do
	root to: 'subs#index'

  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  
  resources :subs, except: :destroy do
    resources :posts, except: :index
  end

end
