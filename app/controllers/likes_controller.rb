class LikesController < ApplicationController

  def create

    like = current_user.likes.new
    
    if params.has_key?("post_id")
      like.likeable_id = params["post_id"]
      like.likeable_type = "Post"
      
    elsif params.has_key?("comment_id")
      like.likeable_id = params["comment_id"]
      like.likeable_type = "Comment"
    else
      like = Like.new
    end

    like.save
    redirect_to :back
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to :back
  end
end
