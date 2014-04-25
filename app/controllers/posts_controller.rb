class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

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
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to current_user
    else
      flash.now[:errors] = @post.errors.full_messages
      redirect_to current_user
    end

  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy
    redirect_to user_url(current_user)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end