class CategoriesController < ApplicationController

  def index

  end


  def show
    @category = Category.find(params[:id])
    @restaurants = @category.restaurants
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