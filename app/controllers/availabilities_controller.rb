class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.all
  end

  def show
    @availability = Availability.find(params[:id])
  end
end
