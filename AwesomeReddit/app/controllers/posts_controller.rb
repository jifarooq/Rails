class PostsController < ApplicationController  
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      render :new_post
    end
  end
  
  def new
    @post = Post.new
    render :new_post
  end
  
  def show 
    @post = Post.find(params[:id])
    render :show_post
  end

  def edit
    @post = Post.find(params[:id])
    
    if current_user.id == @post.user_id
      render :edit_post
    else
      redirect_to sub_post_url(@post)
    end
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      render :edit_post
    end
  end
  
  private
    def post_params
      params.require(:post).permit(
        :title, :url, :content, :user_id, sub_ids: []
      )
    end
end
