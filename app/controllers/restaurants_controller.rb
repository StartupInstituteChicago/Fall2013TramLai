class RestaurantsController < ApplicationController

  def new
    if owner_signed_in?
      @restaurant = Restaurant.new
    else
      flash[:notice] = "You need to sign in as an owner to create a restaurant"
      redirect_to new_owner_session_path
    end
  end
  
  
  def create
    if owner_signed_in?
      @restaurant = Restaurant.new(restaurant_params)
      @restaurant.owner = current_owner
      if @restaurant.save
        flash[:notice] = "Your restaurant was successfully created"
        redirect_to @restaurant
      else
        render 'new'
      end
    else
      redirect_to new_owner_session_path
    end
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  
  
  def index
    @restaurants = Restaurant.all
  end
  

  def edit
    return not_sign_in unless owner_signed_in?
    @restaurant = Restaurant.find(params[:id])
    if current_owner != @restaurant.owner
      flash[:notice] = "You're not authorized to edit this restaurant"
      redirect_to restaurants_path
    end
  end

  
  def update
    params[:restaurant][:category_ids] ||= []
    return not_sign_in unless owner_signed_in?
    @restaurant = Restaurant.find(params[:id])
    if current_owner == @restaurant.owner
      if @restaurant.update(restaurant_params)
        flash[:notice] = "Your restaurant was successfully updated"
        redirect_to restaurant_path(@restaurant)
      else
        render 'edit'
      end
    else
     flash[:notice] = "You're not authorized to update this restaurant"
     redirect_to restaurants_path
    end
  end
  

  def destroy
    return not_sign_in unless owner_signed_in?
    @restaurant = Restaurant.find(params[:id])
    if current_owner == @restaurant.owner
      @restaurant.destroy
      redirect_to restaurants_path
    else
      flash[:notice] = "You're not authorized to update this restaurant"
      redirect_to restaurants_path
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name,:description,:full_address,:phone_number,
      :image,:image_url, :remove_image,:remote_image_url,:menu, {:category_ids => []})
  end

  def not_sign_in
    flash[:notice] = "You need to sign in as this restaurant's owner to manage this restaurant"
    redirect_to new_owner_session_path
  end
  
end


