class Api::LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    if @like.user_id == current_user.id
      @like.save
      render json: @like
    else
      render json: @like.errors.full_messages, status: :unprocessible_entity
    end
    
    
  end
  
  def destroy
    like = Like.find(params[:id])
    like.destroy if like
    render json: {}
  end
  
  private
  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id, :user_id)
  end
end
