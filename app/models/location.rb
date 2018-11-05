class Location < ApplicationRecord
  acts_as_paranoid

  has_many :speeches

  validates :name, presence: true
end
