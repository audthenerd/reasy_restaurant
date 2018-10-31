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

    @reservation = Reservation.new(reservation_params)
    # ["menuitems_reservations_attributes"]["0"])


    @reservation = Reservation.new(reservation_params)
    @reservation.save


    if @reservation.save

#reservation_params["menuitems_reservations_attributes"].each do |item| ["#{item}"] end
    @customer = Customer.find(params[:customer_id])
    redirect_to customer_reservation_path(@customer, @reservation)
  else
    render plain: "fail lei"
  end

  end

  def new
    @reservation = Reservation.new
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

    params.require(:reservation).permit(:restaurant_id, :customer_id, :reservation_date, :reservation_time,  menuitems_reservations_attributes: [:id, :reservation_id, :menuitem_id, :quantity, :destroy])

  end


end