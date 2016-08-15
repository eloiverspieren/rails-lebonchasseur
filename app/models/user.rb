class User < ApplicationRecord
  has_one :profile
  has_many :bookings
  has_many :hunts
  has_many :reviews
end
