class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = current_user.comments.new(comment_params)
    comment.post_id = params["post_id"]

    if comment.save
      redirect_to(:back)
    else
      flash.now[:errors] = comment.errors.full_messages
      redirect_to current_user
    end
  end

  def update
    comment = current_user.comments.find(params[:id])
    comment.update(comment_params)
    redirect_to(:back)
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
