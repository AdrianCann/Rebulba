class FollowingsController < ApplicationController

  def new
    @following = Following.new
  end

  def create
    following = current_user.outbound_followings.new
    following.followee_id = params[:user_id]
    if following.save
    else
      flash.now[:errors] = following.errors.full_messages
    end
    redirect_to :back
  end

  def destroy
    following = current_user.outbound_followings.where("followee_id = ?", params[:id]).first
    following.destroy
    redirect_to current_user
  end
end
