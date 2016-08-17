class Hunt < ApplicationRecord
  belongs_to :user
  has_many :availibities
  has_many :reviews
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
