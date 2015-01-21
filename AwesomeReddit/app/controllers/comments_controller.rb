class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redir_path = @comment.parent_comment_id ? comment_url(@comment.parent_comment_id) : post_url(@comment.post_id)
  		redirect_to redir_path
    else
      flash.now[:errors] = @comment.errors.full_messages
      redirect_to new_post_comment_url(@comment.post_id)
    end
  end

  def new
  	@comment = Comment.new(post_id: params[:post_id])
  end

  def show
    @comment = Comment.find(params[:id])
    @new_comment = Comment.new(
      post_id: @comment.post_id, 
      parent_comment_id: @comment.id
    )
  end

  def destroy
  end

  private
  	def comment_params
      comment_type = params[:comment] ? :comment : :new_comment
  		params.require(comment_type).permit(:body, :post_id, :parent_comment_id)
  	end
end
