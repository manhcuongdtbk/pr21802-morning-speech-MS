class AddDeletedAtToSpeeches < ActiveRecord::Migration[5.2]
  def change
    add_column :speeches, :deleted_at, :datetime
    add_index :speeches, :deleted_at
  end
end
