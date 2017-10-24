class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      flash[:notice] = "#{@restaurant.name} has been created"
      redirect_to admin_path
    else
      flash[:alert] = "There are mistakes in your submission"
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :proce_range, :total_seats, :open_hour, :close_hour)
  end
end
