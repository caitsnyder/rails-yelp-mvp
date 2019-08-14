class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :edit, :update, :destroy]

  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @restaurant = set_restaurant
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
     if @review.save
       redirect_to restaurant_path(set_restaurant)
    else
      render :new
    end
  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
    @review.restaurant = set_restaurant
  end
end
