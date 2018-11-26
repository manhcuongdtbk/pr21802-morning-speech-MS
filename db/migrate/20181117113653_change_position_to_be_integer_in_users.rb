class ChangePositionToBeIntegerInUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :position, :integer
  end

  def down
    change_column :users, :position, :string
  end
end
