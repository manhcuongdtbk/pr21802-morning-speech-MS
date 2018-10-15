class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :title

      t.timestamps
    end

    add_index :themes, :title
  end
end
