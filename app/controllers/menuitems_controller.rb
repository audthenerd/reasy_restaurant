class MenuitemsController < ApplicationController
  before_action :authenticate_userrest!, :except => [ :index ]

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])

    if @restaurant.userrest == current_userrest

    @menuitems = Menuitem.where(restaurant_id: params[:restaurant_id])
    #@restaurants = Restaurant.where(userrest_id: current_userrest.id)
    end
    if current_customer
    @menuitems = Menuitem.where(restaurant_id: params[:restaurant_id])

    end
  end

  def new
  end

  def create
    @newitem = Menuitem.new(menuitem_params)
    @newitem.save

    @restaurant = Restaurant.find(params[:restaurant_id])
    redirect_to restaurant_menuitems_path(@restaurant)
  end

  def show
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menuitem = Menuitem.find(params[:id])
    # render plain: @menuitem.inspect
  end

  def update
    @menuitem = Menuitem.find(params[:id])
    @menuitem.update(menuitem_params)

    redirect_to restaurant_menuitems_path
  end

  def destroy
    @menuitem = Menuitem.find(params[:id])
    @menuitem.delete

    redirect_to restaurant_menuitems_path
  end

  private
  def menuitem_params
    params.require(:menuitem).permit(:item, :restaurant_id, :price, reservations_menuitems_attributes: [:reservation_id, :menuitem_id, :quantity ])
  end
end
