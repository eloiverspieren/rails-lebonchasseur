class Hunt < ApplicationRecord
  belongs_to :user
  has_many :availibities
  has_many :reviews
  has_many :bookings
end
