class BookingsController < ApplicationController
before_action :authenticate_user!
  def new
    @booking = Booking.new
  end

  def create
    @booking = @hunt.bookings.build(booking_params)
    @booking.save
    redirect_to hunt_path(@hunt)
  end
end
