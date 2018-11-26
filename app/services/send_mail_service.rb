class SendMailService
  class << self
    def send_weekly_remind_mail
      User.where("schedule <= ?", Date.today + 7.days).each do |user|
        UserMailer.send_mail(user, "remind_week").deliver
      end
    end

    def send_daily_remind_mail
      User.where(schedule: Date.tomorrow).each do |user|
        UserMailer.send_mail(user, "remind_day").deliver
      end
    end
  end
end
