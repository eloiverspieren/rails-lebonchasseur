class Hunt < ApplicationRecord
  belongs_to :user
  has_many :availibities
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  mount_uploader :photo, PhotoUploader


  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
