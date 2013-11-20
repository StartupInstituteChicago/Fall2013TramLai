require 'spec_helper'

describe ReservationsController do
	before (:each) do
		@owner = FactoryGirl.create(:owner)
		@restaurant = FactoryGirl.create(:restaurant,owner: @owner)
	end 

	describe "GET #new" do
		
	end

	describe "POST #create" do
		it "should create a reservation" do
			post :create, restaurant_id: @restaurant, reservation: {email: "tramlai@gmail.com", 
				requested_date_time: "12/12/2013", 
				message: "I want to book this restaurant"}
			response.should redirect_to restaurant_reservation_path(@restaurant.id, 1)
		end
	end

end
