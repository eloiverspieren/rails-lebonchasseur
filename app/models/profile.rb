class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar_picture, PhotoUploader
end
