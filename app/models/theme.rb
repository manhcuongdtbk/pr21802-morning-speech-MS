class Theme < ApplicationRecord
  acts_as_paranoid

  has_many :speech_themes
  has_many :speeches, through: :speech_themes

  validates :title, presence: true
end
