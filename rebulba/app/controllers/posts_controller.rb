class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save

    else

    end
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params

  end

end
