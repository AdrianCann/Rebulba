class SessionsController < ApplicationController

  def new
    @user = User.find(1)
  end

  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    # @user = User.find_or_create_by_auth_hash(request.env['omniauth.auth'])
    
    if @user
      login(@user)
      redirect_to @user
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
  end

  def destroy
    User.first.update({username: "Demo User",
                        email: "Demo-User@example.com",
                        password: "123456"})
    logout
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
