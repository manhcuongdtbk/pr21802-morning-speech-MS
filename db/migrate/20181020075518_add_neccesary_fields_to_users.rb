class AddNeccesaryFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :staff_id, :integer
    add_column :users, :division, :string
    add_column :users, :group, :string
    add_column :users, :position, :string
  end
end
