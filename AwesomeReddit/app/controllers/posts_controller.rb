class PostsController < ApplicationController
  
  def create
    @post = current_sub_posts.new(post_params)
    @post.author_id = current_user.id
    @post.sub_id = params[:sub_id]

    if @post.save
      redirect_to sub_url(@post.sub)
    else
      render :new_post
    end
  end
  
  def new
    @post = Post.new
    @post.sub_id = params[:sub_id]

    render :new_post
  end
  
  def show 
    @post = Post.find(params[:id])
    render :show_post
  end

  def edit
    @post = Post.find(params[:id])
    
    if current_user.id == @post.author_id
      render :edit_post
    else
      redirect_to sub_post_url(@post)
    end
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      render :show_post
    else
      render :edit_post
    end
  end
  
  private
  
    def current_sub_posts
      Sub.find_by_id(params[:sub_id]).posts
    end
  
    def post_params
      params.require(:post).permit(:title, :url, :content)
    end
    
end
