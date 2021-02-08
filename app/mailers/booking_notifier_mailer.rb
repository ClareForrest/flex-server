class BookingNotifierMailer < ApplicationMailer
  default :from => 'cam022007@coderacademy.edu.au'

  def send_booking_email(user)
    @user = user
    mail( :to => @user.email, :subject => 'Your Booking has been confirmed!')
  end
end