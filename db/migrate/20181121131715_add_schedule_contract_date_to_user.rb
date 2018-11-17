class AddScheduleContractDateToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :schedule, :date
    add_column :users, :contract_date, :date
  end
end
