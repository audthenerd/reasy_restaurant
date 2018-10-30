require 'byebug'

class ReservationsController < ApplicationController

  def index

    if params.keys[2] == "customer_id"
      @reservation = Reservation.where(customer_id: params[:customer_id])
      @customer = Customer.where(id: params[:customer_id])
      @restaurant = Reservation.where(customer_id: params[:customer_id])

    elsif params.keys[2] == "restaurant_id"
      @reservation = Reservation.where(restaurant_id: params[:restaurant_id])
      @restaurant = Restaurant.where(id: params[:restaurant_id])
      @customer = Reservation.where(restaurant_id: params[:restaurant_id])
    end
  end


  def show
  end

  def edit

  end

  def create
    @customer = Customer.find(params[:customer_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.save

    render @reservation.param.inspect
    #redirect_to customer_reservations_path(@customer)

  end

  def new
    # @customer = Customer.find(params[:customer_id])

    # @reservation = Reservation.new(reservation_params)
    # @reservation.save

  end

  def update

  end

  def destroy

  end


  private

  def reservation_params
    params.require(:reservation).permit(:customer_id, :reservation_date, :reservation_time)
  end


end