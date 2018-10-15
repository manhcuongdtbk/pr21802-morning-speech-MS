class Speech < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :speech_themes
  has_many :themes, through: :speech_themes

  validates :title, :content, :speaking_day, :location_id, :user_id,
    presence: true
end
