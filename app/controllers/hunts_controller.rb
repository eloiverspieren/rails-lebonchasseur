class HuntsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @hunts = Hunt.all
    @hunts = Hunt.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@hunts) do |hunt, marker|
      marker.lat hunt.latitude
      marker.lng hunt.longitude
    end
  end

  def show
    @hunt = Hunt.find(params[:id])

    @review = @hunt.reviews.build

    @hunt_coordinates = { lat: @hunt.latitude, lng: @hunt.longitude }

    @hash = Gmaps4rails.build_markers(@hunt) do |hunt, marker|
      marker.lat hunt.latitude
      marker.lng hunt.longitude
    end
  end
end
