require 'spec_helper'

describe ReservationsController do
	describe "GET #new" do
		
	end

	describe "POST #create" do
		before (:each) do
			reservation: {email: "tramlai@gmail.com", 
						requested_date_time: "12/12/2013", 
						message: "I want to book"}
		end

		it "should create a reservation" do
			post :create, reservation: reservation
			response.should be_success
		end
	end

end
