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

  #solutions were misleading.
  #notes should be nested under tracks! (so that params stores track_id?)
  resources :tracks, except: [:index, :new] do
    resources :notes, only: :create
  end

  resources :notes, only: :destroy

end
