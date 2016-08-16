class AvailabilitiesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @availabilities = Availability.all
  end

  def show
    @availability = Availability.find(params[:id])
  end
end
