class CreateSpeeches < ActiveRecord::Migration[5.2]
  def change
    create_table :speeches do |t|
      t.string :title
      t.text :content
      t.date :speaking_day
      t.integer :status
      t.references :location, forgein_key: true

      t.timestamps
    end

    add_index :speeches, :title
  end
end
