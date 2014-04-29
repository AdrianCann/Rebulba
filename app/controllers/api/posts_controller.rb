class Api::PostsController < ApplicationController
  def create
    @post = current_user.posts.new(post_params)

    if @post.save

      render json: @post
    else
      render :json, status: :unprocessible_entity
    end
  end

  def index
    @posts = current_user.posts
    render json: @posts
    # @feed_posts = current_user.genereate_feed_posts(5)
#     render json: @feed_posts

  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      render json: @post
    else
      flash.now[:errors] = @post.errors.full_messages
      render json: @post.errors.full_messages, status: :unprocessible_entity
    end

  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy if post
    render json: {}
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
