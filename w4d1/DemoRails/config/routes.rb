Rails.application.routes.draw do
  resources :users, except: [:edit, :new] do 
    resources :contacts, only: :index
  end
  resources :contacts, except: [:index, :edit, :new]    
  resources :contact_shares, only: [:create, :destroy]
  
  # get 'users/:id' => 'users#show'
  # get '/users' => 'users#index'
  # post '/users' => 'users#create'
  # get '/users/new' => 'users#new'
  # get '/users/id/edit' => 'users#edit', :as => 'edit_user'
  # patch '/users/id' => 'users#update'
  # put '/users/id' => 'users#update'
  # delete '/users/id' => 'users#destroy'
  #
end
