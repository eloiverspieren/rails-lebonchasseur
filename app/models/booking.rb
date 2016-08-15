class Booking < ApplicationRecord
  belongs_to :hunt
  belongs_to :user
end
