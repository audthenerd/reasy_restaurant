class ReviewsController < ApplicationController
    before_action :authenticate_customer! 

    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new(restaurant_id: @restaurant.id)
    end


    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new(review_params)
        #  @review = current_customer.reviews.build(review_parmas)
        @review.customer_id = current_customer.id
        @review.restaurant_id = @restaurant.id

        @review.save
        redirect_to @restaurant
    end

    private

    def review_params
        params.require[:review].permit(:comment, :rating, :restaurant_id, :customer_id)
    end
        
end
