class UserNotifierMailer < ApplicationMailer
  default :from => 'cam022007@coderacademy.edu.au'

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email, :subject => 'Thanks for signing up!')
  end
end