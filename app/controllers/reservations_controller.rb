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
      # customer signed in RESOLVED
      @customer = Customer.find(params[:customer_id])
      @reservation = Reservation.find(params[:id])

      @price = @reservation.menuitems_reservations.map{|y| y.menuitem.price * y.quantity}.reduce(:+)

    elsif current_userrest
     # restaurant signed in RESOLVED
      @restaurant = Restaurant.find(params[:restaurant_id])
      @reservation = Reservation.find(params[:id])

      @price = @reservation.menuitems_reservations.map{|y| y.menuitem.price * y.quantity}.reduce(:+)


    end


  end

  def edit
    if current_customer
      @customer = Customer.find(params[:customer_id])
      @reservation = Reservation.find(params[:id])
      @restaurant = Restaurant.find(@reservation.restaurant_id)
      @menuitems = Menuitem.where(restaurant_id: @restaurant.id)
      gon.breakstart = @restaurant.breakstart.to_s.split(" ")[1]
      gon.breakend = @restaurant.breakend.to_s.split(" ")[1]
      gon.availseats = @restaurant.avail_seats
      @booked = Reservation.all
      @checkvar = @booked.each do |x| x.reservation_time.present? end
    end

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
    @customer = Customer.find(params[:customer_id])
    @reservation = Reservation.find(params[:id])
    params[:reservation].parse_time_select! :reservation_time
    @reservation.update(reservation_params)

    redirect_to customer_reservations_path(@customer)
  end

  def destroy
    @reservation = Reservation.find(params[:id])

    @reservation.destroy
    redirect_to customer_reservations_path(current_customer.id)
  end


  private

  def reservation_params

    params.require(:reservation).permit(:restaurant_id, :customer_id, :reservation_date, :reservation_time , :seats, menuitems_reservations_attributes: [:id, :reservation_id, :menuitem_id, :quantity, :destroy, :update])

  end


end