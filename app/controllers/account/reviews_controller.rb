class Account::ReviewsController < ApplicationController


  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end


  private

  def reviews_params
    params.require(:review).permit(:rating, :content)
  end
end
