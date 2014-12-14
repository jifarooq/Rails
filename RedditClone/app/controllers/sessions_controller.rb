class SessionsController < ApplicationController
  
  #this creates teh session
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password])
      
    if user.nil?
      render :new
    else
      login!(user)
      redirect_to user_url(user)
    end
    
  end
  
  #this is the actual login page
  def new  
    render :new
  end
  
  #this logs out
  def destroy
    logout
    redirect_to new_session_url
  end
  
  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
