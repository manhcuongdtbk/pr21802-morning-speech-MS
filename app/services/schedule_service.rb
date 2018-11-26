class ScheduleService
  class << self
    def set_schedule
      Location.all.each do |location|
        next_month = Date.today.next_month
        working_days = (next_month.beginning_of_month..next_month.end_of_month)
          .reject{|d| [0,6].include? d.wday}
        users = location.users.where("position < 5").order(schedule: :desc)
          .last 50
        if location.name = "FIZZ"
          User.ceo_position.first.update schedule: working_days.first
          beginning_of_weeks = working_days.drop(1).select{|d| d.monday?}
          location.users.division_manager_position
            .sample(beginning_of_weeks.count).each_with_index do |user, index|
              user.update schedule: beginning_of_weeks[index]
            end
          normal_days = working_days.drop(1) - beginning_of_weeks
          users.sample(normal_days.count).each_with_index do |user, index|
            user.update schedule: normal_days[index]
          end
        else
          users.sample(working_days.count).each_with_index do |user, index|
            user.update schedule: working_days[index]
          end
        end
      end
    end
  end
end
