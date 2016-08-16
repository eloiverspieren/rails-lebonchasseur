class Account::AvailibilitiesController < ApplicationController
  def index
    @availibilities = current_user.availibilities
  end

  def show
    @availibility = Availibility.find(params[:id])
  end

  def new
   @availibility = Availibility.new
  end

  def create
    @availibility = Availibility.new(hunts_params)
    @availibility.user = current_user
    @availibility.save
    redirect_to availibilities_path
  end

  def edit
     @availibility = Availibility.find(params[:id])
  end

  def update
    @availibility = Availibility.find(params[:id])
    @availibility.update(availibilities_params)
    redirect_to availibilities_path(@availibility)
  end

  def destroy
    @availibility = Availibility.find(params[:id])
    @availibility.destroy
    redirect_to availibilities_path
  end

  private

  def availibilities_params
    params.require(:availibility).permit(:start_date, :end_date)
  end
end
