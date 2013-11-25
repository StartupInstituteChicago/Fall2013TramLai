class UsersController < ApplicationController

	def profile 
		unless user_signed_in?
			flash[:notice] = "You need to sign in as user to look at your restaurant"
			redirect_to new_user_session_path
		end
	end

	def dashboard
		if user_signed_in?
			restaurants = Restaurant.all
			@restaurants_list = []
			for restaurant in restaurants
				if restaurant.user == current_user
					@restaurants_list.push(restaurant)
				end
			end
			@restaurants_list
		else
			flash[:notice] = "You need to sign in as user to look at your restaurant"
			redirect_to new_user_session_path
		end
	end
	

end
