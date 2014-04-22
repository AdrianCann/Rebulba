class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save

      redirect_to user_url(current_user)
    else
      flash.now[:errors] = @post.errors.full_messages
      redirect_to current_user
    end
  end

  def index
    @posts = current_user.posts
  end

  def show
    post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to current_user
    else
      flash.now[:errors] = @post.errors.full_messages
      redirect_to current_user
    end

  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_url(current_user)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end