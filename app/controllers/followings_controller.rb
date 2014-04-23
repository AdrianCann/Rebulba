class FollowingsController < ApplicationController

  def new
    @following = Following.new
  end

  def create
    params = following_params.merge(follower_id: current_user.id)
    @following = Following.new(params)
    if @following.save
    else
      flash.now[:errors] = @following.errors.full_messages
    end
    redirect_to current_user
  end

  def destroy
    @following = Following.find_by_follower_id_and_followee_id(current_user.id, params[:id])
    @following.destroy
    redirect_to current_user
  end

  private
  def following_params
    params.require(:following).permit(:followee_id)
  end

end
