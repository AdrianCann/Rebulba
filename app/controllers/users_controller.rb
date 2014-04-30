class UsersController < ApplicationController
  skip_before_action :require_logged_in, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to current_user
      #msg = UserMailer.welcome_email(@user)
      #msg.deliver!
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.includes(:posts).includes(:comments).find(params[:id])

    
    @new_post = Post.new
    @new_following = Following.new
    
    @feed_posts = @user.generate_feed_posts

    @user_posts = @user.posts

  end

  def edit
    @user = User.new
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to current_user
    else
      flash.now[:errors] = current_user.errors.full_messages
      render :edit
    end
  end

  def destroy
    current_user.destroy
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end

end
