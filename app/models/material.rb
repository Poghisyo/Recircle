class Material < ApplicationRecord
  belongs_to :seller, class_name: 'User', foreign_key: 'user_id'

  has_many :purchase
  validates :title, presence: true
end
