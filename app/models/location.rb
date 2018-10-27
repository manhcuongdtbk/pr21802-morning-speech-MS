class Location < ApplicationRecord
  has_many :speeches

  validates :name, presence: true
end
