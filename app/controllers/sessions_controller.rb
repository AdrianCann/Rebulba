class SessionsController < ApplicationController

  def new
    @user = User.find(1)
  end

  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user
      login(@user)
      redirect_to @user
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
  end

  def destroy
    logout
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
