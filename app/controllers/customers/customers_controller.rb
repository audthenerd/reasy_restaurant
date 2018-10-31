
class CustomersController < ApplicationController

  def index

  end


  def show
    @customer = Customer.find(params[:id])
    render plain: @customer

  end

  def edit

  end

  def create

  end

  def new

  end

  def update

  end

  def destroy

  end


end