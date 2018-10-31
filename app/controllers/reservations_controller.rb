require 'byebug'

class ReservationsController < ApplicationController

  def index

    if current_customer
      # customer signed in RESOLVED
      @reservation = Reservation.where(customer_id: params[:customer_id])
      @customer = Customer.find(params[:customer_id])
      @booked = Reservation.where(customer_id: params[:customer_id])
      @restaurant = @customer.restaurants


    elsif current_userrest
      # restaurant signed in UNRESOLVED
      @reservation = Reservation.where(restaurant_id: params[:restaurant_id])
      @restaurant = Restaurant.where(id: params[:restaurant_id])
      @customer = Reservation.where(restaurant_id: params[:restaurant_id])


      @booked = Reservation.all
    end
  end


  def show
    if current_customer
      # customer signed in UNRESOLVED
      @customer = Customer.find(params[:customer_id])
      @reservation = Reservation.find(params[:id])
      @restaurant = Restaurant.where(id: @reservation.restaurant_id)

      @orders = @reservation.menuitems
      @quantity = MenuitemsReservation.find(reservation_id: @reservation)

      render plain: @quantity.inspect


    elsif current_userrest
     # restaurant signed in UNRESOLVED

    end

  end

  def edit

  end

  def create
    params[:reservation].parse_time_select! :reservation_time

    @reservation = Reservation.new(reservation_params)
    # ["menuitems_reservations_attributes"]["0"])


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

    params.require(:reservation).permit(:restaurant_id, :customer_id, :reservation_date, :reservation_time ,  menuitems_reservations_attributes: [:id, :reservation_id, :menuitem_id, :quantity, :destroy])

  end


end