class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to current_user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    @new_post = Post.new
    @new_following = Following.new
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
