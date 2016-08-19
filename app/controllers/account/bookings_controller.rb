class Account::BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
    @bookings += Booking.where(hunt_id: current_user.hunts.map(&:id))
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @hunt = Hunt.find(params[:hunt_id])

    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.hunt = @hunt
    @booking.save!
    redirect_to account_bookings_path
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :price)
  end
end

