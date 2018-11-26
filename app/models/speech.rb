class Speech < ApplicationRecord
  include PublicActivity::Common

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :location
  belongs_to :user
  has_many :speech_themes
  has_many :themes, through: :speech_themes

  validates :theme_ids, :title, :content, :speaking_day, :location_id,
    :user_id, :slug, presence: true

  enum status: {passive: 0, active: 1}, _suffix: true

  acts_as_paranoid

  scope :created_at_desc, ->{order created_at: :desc}

  def should_generate_new_friendly_id?
    title_changed? || super
  end
end
