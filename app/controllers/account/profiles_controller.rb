class Account::ProfilesController < ApplicationController

  def show
    @profile = current_user.profile
  end

  def new
   @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.save
    redirect_to account_profile_path
  end

  def edit
    @profile = current_user.profile
    if @profile.nil?
      redirect_to new_account_profile_path
    end
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)
    redirect_to account_profile_path
  end

  def destroy
    @profile = current_user.profile
    @profile.destroy
    redirect_to root_path
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :email, :phone, :license_number, :avatar_picture)
  end
end
