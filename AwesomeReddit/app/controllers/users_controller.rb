class UsersController < ApplicationController
  
  #this actually does the creation
  def create
    @user = User.new(user_params)
    
    if @user.save
      #take them to their show page
      login!(@user)
      #redirect to /users/123
      redirect_to user_url(@user)
    else
      #take the user back to new form
      render :new
    end
  end
  
  #this is /users/new, but fetches the form
  def new
    @user = User.new
    render :new
  end
  
  #this is /users/1
  def show
    @user = current_user
    render :show
  end

  #this is /users, done in haml!
  def index
    @users = User.all
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
