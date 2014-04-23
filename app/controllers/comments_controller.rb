class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params["post_id"]

    if @comment.save
      redirect_to current_user
    else
      flash.now[:errors] = @comment.errors.full_messages
      redirect_to current_user
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
