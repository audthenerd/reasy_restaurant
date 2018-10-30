class CustomersController < ApplicationController

  def index
    @customer = Customer.all
    if params[:restaurant]
      @restaurant = Restaurant.where('restaurant LIKE ?', "%#{params[:restaurant]}%")
    else
      @restaurant = Restaurant.all
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

  end

  def update

    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to @customer
  end

  def destroy

  end


  private

  def customer_params
    params.require(:customer).permit(:name, :image_url)
  end


end