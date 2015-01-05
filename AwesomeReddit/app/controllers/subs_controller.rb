class SubsController < ApplicationController
  
  def index
    @subs = Sub.all
    render :index
  end
  
  def create
    @sub = current_user.subs.new(sub_params)
    
    #id not assigned until save
    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end
  
  def new
    @sub = Sub.new
    render :new
  end
  
  def show 
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    
    if current_user.id == @sub.moderator_id
      render :edit
    else
      redirect_to sub_url(@sub)
    end
  end
  
  def update
    @sub = Sub.find(params[:id])
    
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
      # render :show
    else
      render :edit
    end
  end
  
  private
  
    def sub_params
      params.require(:sub).permit(:title, :description, :moderator_id)
    end
  
end
