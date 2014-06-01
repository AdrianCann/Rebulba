class SessionsController < ApplicationController

  def new
    @user = User.find(1)
  end

  def create
    
    if request.env['omniauth.auth']
      login_with_facebook
    else
      login_without_facebook
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
  
  def login_without_facebook
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
  
  def login_with_facebook
    hash = request.env['omniauth.auth']
    facebook_name = hash[:extra][:raw_info][:name]
    facebook_email = hash[:extra][:raw_info][:email]
    @user = User.find_by_email(facebook_email)
    if !@user
      #dont create
      random_password = SecureRandom::urlsafe_base64(16)
      @user = User.create({email: facebook_email, username: facebook_name, password: random_password})
    end
    
    login(@user)
    redirect_to @user
  end

end
