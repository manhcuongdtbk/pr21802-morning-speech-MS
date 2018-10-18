class Location < ApplicationRecord
  has_many :speeches
  has_many :users

  validate :name, presence: true
end
