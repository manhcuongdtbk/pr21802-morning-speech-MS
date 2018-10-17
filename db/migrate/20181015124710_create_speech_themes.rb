class CreateSpeechThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :speech_themes do |t|
      t.references :speech, forgein_key: true
      t.references :theme, forgein_key: true

      t.timestamps
    end
  end
end
