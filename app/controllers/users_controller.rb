class UsersController < ApplicationController
  before_action :require_logged_in
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
    @user = User.find(params[:id])

    
    @new_post = Post.new
    @new_following = Following.new
    
    @feed_posts = @user.generate_feed_posts if @user == current_user

    @user_posts = @user.posts.includes(:comments => [:likes, :comment_sender], :likes => [:user])
    @own_page = (current_user == @user)

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
    if current_user.id > 6
      current_user.destroy
      redirect_to new_session_url
    else
      flash.now[:errors] = ["you didn't create this user!"]
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end

end
