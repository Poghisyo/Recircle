class Material < ApplicationRecord
  after_validation :geocode, if: :address_changed?
  belongs_to :seller, class_name: 'User', foreign_key: 'user_id'

  has_many :purchase
  validates :title, presence: true

  geocoded_by :address
end
