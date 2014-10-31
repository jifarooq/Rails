Rails.application.routes.draw do

	root to: 'bands#index'
	
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:create, :new, :show]

  resources :bands do 
  	resources :albums, only: :new
  end
 
  resources :albums, except: [:index, :new] do
  	resources :tracks, only: :new
  end

  resources :tracks, except: [:index, :new]

end
