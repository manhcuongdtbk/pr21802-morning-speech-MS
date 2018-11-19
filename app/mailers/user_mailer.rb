class UserMailer < ApplicationMailer
  def speech_tomorrow user
    @user = user
    mail to: user.email, subject: t(".subject")    
  end
end
