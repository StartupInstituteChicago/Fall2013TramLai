class OwnersController < ApplicationController

	def profile 
		unless owner_signed_in?
			flash[:notice] = "You need to sign in as owner to look at your restaurant"
			redirect_to new_owner_session_path
		end
	end

	def dashboard
		if owner_signed_in?
			restaurants = Restaurant.all
			@restaurants_hash = []
			for restaurant in restaurants
				if restaurant.owner == current_owner
					@restaurants_hash.push(restaurant)
				end
			end
			@restaurants_hash
		else
			flash[:notice] = "You need to sign in as owner to look at your restaurant"
			redirect_to new_owner_session_path
		end
	end
	

end
