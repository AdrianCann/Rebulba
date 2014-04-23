class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      msg = UserMailer.welcome_email(@user)
      msg.deliver!
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
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
