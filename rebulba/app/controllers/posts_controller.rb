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
      render :new
    end
  end

  def index
    @posts = current_user.posts
  end

  def edit
    post = Post.find(params[:id])
  end

  def update
    fail
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