class Account::ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
  end

  def new
   @profile = Profile.new
  end

  def create
    @profile = Profile.new(profiles_params)
    @profile.user = current_user
    @profile.save
    redirect_to profiles_path
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profiles_params)
    redirect_to profiles_path(@profile)
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to pages_path
  end

  private

  def profiles_params
    params.require(:profile).permit(:name, :email, :phone, :license_number, :avatar_picture)
  end
end
