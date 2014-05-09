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
    comment = Comment.find(params[:id])
    if comment.comment_sender == current_user || comment.post.user == current_user
      comment.destroy
    end
    render json: {}
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
  
end
