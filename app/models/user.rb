class User < ApplicationRecord
  has_many :speeches, dependent: :destroy
  has_many :services
  mount_uploader :avatar, AvatarUploader

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable, :omniauthable
end
