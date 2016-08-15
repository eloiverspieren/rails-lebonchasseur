class HuntsController < ApplicationController
  def index
    @hunts = Hunt.all
  end

  def show
    @hunt = Hunt.find(params[:id])
  end
end
