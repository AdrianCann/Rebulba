class Api::CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save

      render json: @comment
    else
      render :json, status: :unprocessible_entity
    end
  end
  
  def destroy
    
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
  
end
