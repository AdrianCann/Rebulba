class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = current_user.sent_comments.new(comment_params)
    post = Post.find(params[:post_id])
    comment.post = post
    if comment.save

      redirect_to(:back)
    else
      flash.now[:errors] = comment.errors.full_messages
      redirect_to current_user
    end
  end

  def update
    comment = current_user.sent_comments.find(params[:id])
    comment.update(comment_params)
    redirect_to(:back)
  end

  def destroy
    comment = current_user.sent_comments.find(params[:id]) ||
    comment = current_user.comments.find(params[:id])
    comment.destroy
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
