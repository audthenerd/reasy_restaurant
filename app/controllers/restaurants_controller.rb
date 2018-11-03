require 'byebug'

class RestaurantsController < ApplicationController

  def index
    if current_userrest
      @restaurants = Restaurant.where(userrest_id: current_userrest.id)

      @pie = @restaurants.map do |x|
        @menuitems = Menuitem.where(restaurant_id: x)
        @mr = MenuitemsReservation.where(menuitem_id: @menuitems)
        @group = @mr.map do |y|
          [y.menuitem.item, y.quantity]
        end
        @group.each_with_object(Hash.new(0)){|(k,v), h| h[k] +=v}
      end

    elsif current_customer
      @restaurantlist = Restaurant.all
      if params[:option] == "name" && params[:search] != nil
        @restaurants = Restaurant.where('lower(name) LIKE ?', "%#{params[:search.downcase]}%")
      elsif params[:option] == "location" && params[:search] != nil
        @restaurants = Restaurant.near(params[:search], 3) if params[:search].present?
      else
        @restaurants = Restaurant.near([current_customer.latitude, current_customer.longitude], 5)
         @categories = Category.all
      end
    else # visitors of the page with no logins
      if params[:search].present?
        @restaurants = Restaurant.where('lower(name) LIKE ?', "%#{params[:search.downcase]}%")
      else
        @categories = Category.all
      end
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @category = @restaurant.categories
    @reviews = Review.where(restaurant_id: @restaurant)
    if @reviews.blank?
      @average_rating = 0
    else
      @average_rating = @reviews.average(:rating).round(2)
    end
  end

  def new
    @restaurant = Restaurant.new
    @categories = Category.all

  end

  def create
    #render plain: params[:restaurant].inspect
    params[:restaurant].parse_time_select! :starttime
    params[:restaurant].parse_time_select! :endtime
    params[:restaurant].parse_time_select! :breakstart
    params[:restaurant].parse_time_select! :breakend
    @restaurant = Restaurant.new(restro_params)
    @restaurant.userrest = current_userrest
    @categories = Category.all

    if @restaurant.image_url
      params[:restaurant][:image_url].each do |image|
        uploaded_file = image.path
        cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
        @restaurant.image_url << cloudnary_file['public_id']
      end
    end

    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.userrest == current_userrest
      @restaurant.update(restro_params)
      if @restaurant.image_url
        uploaded_file = params[:restaurant][:image_url].path
        cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
        @restaurant.image_url = cloudnary_file['public_id']
      end
      if @restaurant.save
        redirect_to @restaurant
      else
        render 'index'
      end
    else
      render 'index'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restro_params

    params.require(:restaurant).permit(:name, :starttime, :endtime, :breakstart, :breakend, :avail_seats, :telephone, :opening_hours, :street, :city, :zip, :latitude, :longitude, :image_url, :image2_url, :image3_url, :userrest_id, :category_ids => [])
  end

end

