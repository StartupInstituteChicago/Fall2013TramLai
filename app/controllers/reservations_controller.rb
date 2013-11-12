class ReservationsController < ApplicationController

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.build
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.build(reservation_params)
		if @reservation.save
			redirect_to restaurant_reservation_path(@reservation.restaurant_id, @reservation.id)
		else
			render "new"
		end
	end

	def show
		@reservation = Reservation.find(params[:id])
	end


	def index 
		@restaurant = Restaurant.find(params[:restaurant_id])
		if owner_signed_in? and current_owner == @restaurant.owner
			@reservations = @restaurant.reservations
		else
			flash[:notice] = "You are not authorized for this action"
			redirect_to restaurants_path
		end
	end

	def update
		@reservation = Reservation.new(params[:id])
		if @reservation.update(reservation_params)
			redirect_to @reservation
		else
			render "edit"
		end
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def destroy
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.find(params[:id])
		if current_owner == @reservation.restaurant.owner
			@reservation.destroy
			redirect_to restaurant_reservations_path(@reservation.restaurant_id)
		else
			flash[:notice] = "You are not authorized to delete a reservation"
			redirect_to restaurants_path
		end


	end


	private
	def reservation_params
		params.require(:reservation).permit(:email, :requested_date_time, :message)
	end


end
