class Api::LikesController < ApplicationController
  def create
    @like = Like.new(like_params).user_id = current_user.id
    @like.save
    render json: @like
  end
  
  def destroy
    like = Like.find(params[:id])
    like.destroy if like
    render json: {}
  end
  
  private
  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id)
  end
end
