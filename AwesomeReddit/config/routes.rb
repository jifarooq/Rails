Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  
  resources :subs, except: :destroy do
    resources :posts, only: [:new, :create, :edit, :update, :destroy, :show]
  end

end
