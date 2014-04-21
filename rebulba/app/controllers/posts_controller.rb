class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render :show
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def index
    @post = Post.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

end
