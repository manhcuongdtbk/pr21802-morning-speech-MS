class Location < ApplicationRecord
  has_many :speeches

  validates :name, presence: true

  acts_as_paranoid
end
