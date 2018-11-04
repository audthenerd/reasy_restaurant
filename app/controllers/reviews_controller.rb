class ReviewsController < ApplicationController
    before_action :authenticate_customer!

    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new

        if params.has_key?(:restaurant_id)
          @restaurants = Restaurant.where(id: params[:restaurant_id])
        else
          @restaurants = Restaurant.all
        end
      end

    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new(review_params)
        @review.customer = current_customer

        if @review.save
            redirect_to @restaurant
        end
    end

    private

    def review_params
        params.require(:review).permit(:comment, :rating, :restaurant_id)
    end

end
