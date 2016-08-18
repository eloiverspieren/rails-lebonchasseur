class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    hunt = Hunt.find(params[:hunt_id])
    @review = hunt.reviews.build(reviews_params)
    @review.user = current_user
    @review.save
    redirect_to hunt_path(params[:hunt_id])
  end

  def edit
     @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(reviews_params)
    redirect_to reviews_path(@review)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to hunt_path(params[:hunt_id])
  end

  private

  def reviews_params
    params.require(:review).permit(:rating, :content)
  end
end

