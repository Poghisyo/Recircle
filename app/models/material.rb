class Material < ApplicationRecord
  after_validation :geocode, if: :address_changed?
  belongs_to :seller, class_name: 'User', foreign_key: 'user_id'

  has_many :purchases
  has_many :catergories
  validates :title, presence: true

  scope :visible, -> { where(hidden: false) }

  geocoded_by :address
  mount_uploader :photo, PhotoUploader

end
