class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end
  
  
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end
  
  
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  
  
  def index
    @restaurants = Restaurant.all
  end
  
  def edit
    @restaurant = Restaurant.find(params[:id])
  end
  
  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end
  
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end
  
  # def destroy_image
#     @restaurant = Restaurant.find(params[:id])
#     @restaurant.image = ""
#     redirect_to @restaurant
#   end 
  
  private
  def restaurant_params
    params.require(:restaurant).permit(:name,:description,:full_address,:phone_number,:image,:image_url, :remove_image,:remote_image_url)
  end
  
end
