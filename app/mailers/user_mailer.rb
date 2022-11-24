class UserMailer < ApplicationMailer
  def send_password(user, password)
    @user = user.email
    @password = password
 
    mail to: user.email
  end
 end
