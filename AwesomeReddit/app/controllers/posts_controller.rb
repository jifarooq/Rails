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
  end
  
  def show 
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    
    if current_user.id == @post.user_id
      render :edit
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

  def downvote; vote(-1); end
  def upvote; vote(1); end
  
  private
    def post_params
      params.require(:post).permit(
        :title, :url, :content, :user_id, sub_ids: []
      )
    end

    # custom action!
    def vote(direction)
      @post = Post.find(params[:id])
      criteria = { user_id: current_user.id,
                   votable_id: @post.id, 
                   votable_type: "Post" }
      @vote = Vote.find_by(criteria)

      if @vote
        @vote.update(value: direction)
      else
        criteria[:value] = direction
        @post.votes.create!(criteria)
      end

      redirect_to post_url(@post)
    end
end
