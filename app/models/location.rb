class Location < ApplicationRecord
  has_many :speeches
  has_many :users
end
