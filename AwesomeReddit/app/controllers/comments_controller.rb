class CommentsController < ApplicationController
  def create
  	@comment = current_user.comments.new(comment_params)
  	@comment.post_id = params[:post_id]

		flash[:errors] = @comment.errors.full_messages
		redirect_to post_url(@comment.post_id)
  end

  def new
  	@comment = Comment.new(post_id: params[:post_id])
  end

  def destroy
  end

  private
  	def comment_params
  		params.require(:comment).permit(:body)
  	end
end
