class Account::ReviewsController < ApplicationController


  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
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
