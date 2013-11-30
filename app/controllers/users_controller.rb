class UsersController < ApplicationController

	def profile 
		user_not_signed_in
	end

	def dashboard
		if user_signed_in? and current_user.owner?
			restaurants = Restaurant.all
			@restaurants_list = []
			for restaurant in restaurants
				if restaurant.user == current_user
					@restaurants_list.push(restaurant)
				end
			end
			@restaurants_list
		else
			user_not_signed_in
		end
	end

	def my_stars
		if user_signed_in?
			@starred_restaurant_list = current_user.starred_restaurants
		else
			user_not_signed_in
		end
	end

	def user_not_signed_in
		unless user_signed_in?
			flash[:notice] = "You are currently not signed in. Please sign in first"
			redirect_to new_user_session_path
		end
	end


	

end
