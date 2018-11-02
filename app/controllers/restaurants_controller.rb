require 'byebug'

class RestaurantsController < ApplicationController

  def index
    if current_userrest
      @restaurants = Restaurant.where(userrest_id: current_userrest.id)

# ******************************
# Graph: To get x-axis (timing)
# ******************************
      time_start = DateTime.new(2018, 02, 24, 10, 30, 0, "+8:00")
      time_end = DateTime.new(2018, 02, 24, 22, 30, 0, "+8:00")
       @timing = Array.new

      (time_start.to_i..time_end.to_i).step(15.minutes).each do |time|
        @timing.push(Time.at(time).strftime("%H:%M"))
      end

# ************************************
# Graph: To get y-axis (reservations)
# ************************************
@reservations = Reservation.all

@data = @timing.map {|time| [time, 0] }

@counts = Hash.new(0)
@reservations.each{|reserve| @counts[reserve.reservation_time.strftime("%H:%M")] += 1}

@counts.length.times do |x|
  @data.length.times do |y|
    if @counts.keys[x] == @data[y].first
      @data[y][1] += @counts.values[x]
    end
  end
end



# ************************************
# Graph: To get name of each plot
# ************************************



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

    params.require(:restaurant).permit(:name, :street, :city, :zip, :latitude, :longitude, :image_url, :image2_url, :image3_url, :userrest_id, :category_ids => [])
  end

end

