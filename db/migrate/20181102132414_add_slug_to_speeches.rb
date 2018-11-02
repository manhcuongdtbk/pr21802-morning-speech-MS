class AddSlugToSpeeches < ActiveRecord::Migration[5.2]
  def change
    add_column :speeches, :slug, :string, null: false
    add_index :speeches, :slug, unique: true
  end
end
