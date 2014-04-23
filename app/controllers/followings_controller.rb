class FollowingsController < ApplicationController

  def new
    @following = Following.new
  end

  def create
    following = Following.new
    following.follower_id = current_user.id
    following.followee_id = params[:user_id]
    if following.save
    else
      flash.now[:errors] = following.errors.full_messages
    end
    redirect_to :back
  end

  def destroy
    following = Following.find_by_follower_id_and_followee_id(current_user.id, params[:id])
    following.destroy
    redirect_to current_user
  end
end
