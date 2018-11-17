class UserMailer < ApplicationMailer
  def send_mail user, mail_type
    @user = user
    @content = t(".#{mail_type}_content", schedule: user.schedule)
    mail to: user.email, subject: t(".#{mail_type}_subject")
  end
end
