# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
every :day, at: "3:00 pm" do
  runner "SendMailService.send_daily_remind_mail"
end

every :friday, at: "3:00 pm" do
  runner "SendMailService.send_weekly_remind_mail"
end

every '0 0 15 * *' do
  runner "ScheduleService.set_schedule"
end
