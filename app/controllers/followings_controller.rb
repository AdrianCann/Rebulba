class FollowingsController < ApplicationController

  def new
    @following = Following.new
  end

  def create
    @following = Following.new(following_params.merge(follower_id: current_user.id))
    if @following.save
      redirect_to current_user
    else
      flash.now[:errors] = ["No such person to follow!"]
    end

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
