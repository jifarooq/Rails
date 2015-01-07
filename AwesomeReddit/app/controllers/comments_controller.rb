class CommentsController < ApplicationController
  def create
  	@comment = current_user.comments.new(comment_params)

    if @comment.save
  		redirect_to post_url(@comment.post_id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      redirect_to new_post_comment_url(@comment.post_id)
    end
  end

  def new
  	@comment = Comment.new(post_id: params[:post_id])
  end

  def destroy
  end

  private
  	def comment_params
  		params.require(:comment).permit(:body, :post_id, :parent_comment_id)
  	end
end
