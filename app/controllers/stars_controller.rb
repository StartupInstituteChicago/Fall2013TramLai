class StarsController < ApplicationController
  before_filter :check_user_log_in?, only: [:new, :create]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @star = @restaurant.stars.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @star = @restaurant.stars.new
    @star.user_id = current_user.id
    if @star.save
      flash[:notice] = "You have successfully starred this restaurant"
      redirect_to restaurant_path(@restaurant.id)
    else
      render 'new'
    end
  end


  def destroy
    @star = Star.find(params[:id])
    @star.destroy
    flash[:notice] = "You have successfully unstarred this restaurant"
    redirect_to restaurants_path
  end

  def check_user_log_in?
    unless user_signed_in?
      flash[:notice] = "You must be logged in to star this restaurant"
      redirect_to new_user_session_path
    end
  end

  private 
  def star_params
    params.require(:star).permit(:restaurant_id, :user_id)
  end


end
