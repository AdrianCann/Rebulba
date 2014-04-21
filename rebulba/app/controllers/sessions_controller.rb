class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(user_params[:email, user_params[:password])

    if @user
      login(@user)
    else
      flash.now[:errors] = ["Invalid Credentials"]
    end
  end

  def destroy
    logout
    render :new
  end

  private
  def user_params
    require(:user).permit(:email, :password)
  end

end
