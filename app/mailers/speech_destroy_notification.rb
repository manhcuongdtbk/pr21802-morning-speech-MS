class SpeechDestroyNotification < ApplicationMailer
  def warn_user user
    @user = user
    mail to: user.email, subject: t(".subject")
  end
end
