class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :speeches, dependent: :destroy
  has_many :services, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  validates :slug, presence: true

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable, :omniauthable
end
