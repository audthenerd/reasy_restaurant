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
    @customer = Customer.find(params[:id])

  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create

    @customer = Customer.new(customer_params)
    @customer.save

    redirect_to customers_path

  end

  def new
    @reservation = Reservation.new(reservation_params)
    @reservation.save

    redirect_to customers_path
  end

  def update


  end

  def destroy

  end


  private

  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :customer_id, :reservation_date, :reservation_time)
  end



end