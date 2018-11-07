class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_paranoid

  has_many :speeches
  has_many :services, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  validates :slug, presence: true

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable, :omniauthable

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
