class UserMailer < ActionMailer::Base
  default from: "admin@rebulba.com"

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/session"
    mail(to: user.email, subject: "Welcome to Rebulba-Blogger!")
  end

  def notification_email

  end
end
