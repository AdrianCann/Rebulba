class FollowingsController < ApplicationController

  def new
    Following.new
  end

  def create

  end

  def destroy

  end

  private
  def following_params
    params.require(:following).permit(:followee_id)
  end

end
