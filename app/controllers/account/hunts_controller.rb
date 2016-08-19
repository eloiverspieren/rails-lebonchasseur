class Account::HuntsController < ApplicationController
  def index
    @hunts = current_user.hunts.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@hunts) do |hunt, marker|
      marker.lat hunt.latitude
      marker.lng hunt.longitude
    end
  end

  def show
    @hunt = Hunt.find(params[:id])

    @hunt_coordinates = { lat: @hunt.latitude, lng: @hunt.longitude }

    @hash = Gmaps4rails.build_markers(@hunt) do |hunt, marker|
      marker.lat hunt.latitude
      marker.lng hunt.longitude
    end
  end

  def new
   @hunt = Hunt.new
  end

  def create
    @hunt = Hunt.new(hunt_params)
    @hunt.user = current_user
    @hunt.save
    redirect_to account_hunts_path
  end

  def edit
     @hunt = Hunt.find(params[:id])
  end

  def update
    @hunt = Hunt.find(params[:id])
    @hunt.update(hunt_params)
    redirect_to account_hunt_path
  end

  def destroy
    @hunt = Hunt.find(params[:id])
    @hunt.destroy
    redirect_to account_hunts_path
  end

  private

  def hunt_params
    params.require(:hunt).permit(:name, :address, :day_price, :capacity, :photo, :photo_cache)
  end
end
