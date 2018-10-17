class Theme < ApplicationRecord
  has_many :speech_themes
  has_many :speeches, through: :speech_themes

  validates :title, presence: true
end
