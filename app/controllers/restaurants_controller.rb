class RestaurantsController < ApplicationController
  def index
    if current_userrest
      @restaurants = Restaurant.where(userrest_id: current_userrest.id)

    elsif current_customer
      if params[:name] != nil
        @restaurants = Restaurant.where('lower(name) LIKE ?', "%#{params[:name.downcase]}%")

      else
        @restaurants = Restaurant.near([current_customer.latitude, current_customer.longitude])
         @categories = Category.all
      end
    else
      if params[:name] != nil
        @restaurants = Restaurant.where('lower(name) LIKE ?', "%#{params[:name.downcase]}%")
      else

        @categories = Category.all
      end
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    #render plain: params[:restaurant].inspect
    @restaurant = Restaurant.new(restro_params)
    @restaurant.userrest = current_userrest

    if @restaurant.image_url
      uploaded_file = params[:restaurant][:image_url].path
      cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
      @restaurant.image_url = cloudnary_file['public_id']
    # else
    #   @restaurant.photo_url = $result.data.image_url
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

    @restaurant.delete
    redirect_to restaurants_path
  end

  private

  def restro_params

    params.require(:restaurant).permit(:name, :category, :street, :city, :zip, :latitude, :longitude, :image_url, :image2_url, :image3_url, :userrest_id)
  end

end

