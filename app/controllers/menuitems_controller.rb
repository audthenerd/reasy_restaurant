require 'json'

class MenuitemsController < ApplicationController
  before_action :authenticate_userrest!, :except => [ :index, :ajax ]
  skip_before_action :verify_authenticity_token, only: [:ajax]

  def ajax

    @reservationtime = Reservation.where(reservation_date: params[:reservation][:reservation_date])
    hash = {}
    if !@reservationtime.empty?
      @reservationtime.each do |i|
        if hash[i.reservation_time].nil?
          hash[i.reservation_time] = i.seats.to_i
        else
          hash[i.reservation_time] += i.seats.to_i
        end
      end
    end
     render json: hash.to_json
    # render json: { ok: @reservationtime }, status: 200

  end


  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menuitems = Menuitem.where(restaurant_id: params[:restaurant_id])


    if @restaurant.userrest == current_userrest

      @menuitems = Menuitem.where(restaurant_id: params[:restaurant_id])
      #@restaurants = Restaurant.where(userrest_id: current_userrest.id)
    end

    if current_customer
    @menuitems = Menuitem.where(restaurant_id: params[:restaurant_id])
    @reservation = Reservation.new
    @booked = Reservation.all

    gon.breakstart = @restaurant.breakstart.to_s.split(" ")[1]
    gon.breakend = @restaurant.breakend.to_s.split(" ")[1]
    gon.availseats = @restaurant.avail_seats
    @checkvar = @booked.each do |x| x.reservation_time.present?
      
    end
    end

    if params[:reservation]
      @reservationtime = Reservation.where(reservation_date: params[:reservation5Breservation_date5D])
      render plain: params.inspect
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
    @menuitems = Menuitem.where(restaurant_id: @restaurant.id)
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
    params.require(:menuitem).permit(:item, :restaurant_id, :price, menuitems_reservations_attributes: [:customer_id, :menuitem_id, :quantity ])
  end

end
