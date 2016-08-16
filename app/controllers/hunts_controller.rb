class HuntsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @hunts = Hunt.all
  end

  def show
    @hunt = Hunt.find(params[:id])
  end
end
