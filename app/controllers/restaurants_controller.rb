class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    if params[:search]
      @restaurants = Restaurant.search(params[:search]).order("created_at DESC")
    else
      Restaurant.all
    end
  end

  def new
    if current_user.restaurant
      flash[:notice] = "You have already created a restaurant"
      redirect_to admin_path
    else
      @restaurant = Restaurant.new
    end
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

  def edit
    @restaurant = Restaurant.find(params[:id])
    @restaurant.open_hour = @restaurant.open_hour.strftime('%I:%M%p')
    @restaurant.close_hour = @restaurant.close_hour.strftime('%I:%M%p')
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to admin_path
    else
      flash[:alert] = "There are mistakes in your submission"
      render :edit
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :price_range, :total_seats, :open_hour, :close_hour, :description, :image, :twitter_handle)
  end
end
