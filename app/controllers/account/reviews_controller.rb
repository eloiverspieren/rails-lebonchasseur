class Account::ReviewsController < ApplicationController
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
    @review = Review.new(hunts_params)
    @review.save
    redirect_to reviews_path
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
    @review = review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def reviews_params
    params.require(:review).permit(:rating, :content)
  end
end
