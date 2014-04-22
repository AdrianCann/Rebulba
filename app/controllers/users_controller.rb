class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @new_post = Post.new

    @people_he_follows = @user.people_he_follows
    @followers = @user.followers
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
