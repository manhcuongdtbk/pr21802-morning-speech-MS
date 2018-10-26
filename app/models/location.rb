class Location < ApplicationRecord
  has_many :speeches
  has_many :users

  validates :name, presence: true
end
