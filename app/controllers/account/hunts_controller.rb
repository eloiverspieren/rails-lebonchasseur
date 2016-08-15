class HuntsController < ApplicationController
  def index
    @hunts = current_user.hunts
  end

  def show
    @hunt = Hunt.find(params[:id])
  end

  def new
   @hunt = Hunt.new
  end

  def create
    @hunt = Hunt.new(hunts_params)
    @hunt.user = current_user
    @hunt.save
    redirect_to hunts_path
  end

  def edit
     @hunt = Hunt.find(params[:id])
  end

  def update
    @hunt = Hunt.find(params[:id])
    @hunt.update(hunts_params)
    redirect_to hunts_path(@hunt)
  end

  def destroy
    @hunt = Hunt.find(params[:id])
    @hunt.destroy
    redirect_to hunts_path
  end

  private

  def hunts_params
    params.require(:hunt).permit(:name, :address, :day_price, :capacity)
  end
end
