class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		@restaurants = @category.restaurants.all
	end

	def search
		if params[:search]
			list_category_names = params[:search].split(',') #split the categories input into array
			 
			list_categories = list_category_names.map do |name|
				Category.where("name LIKE ?", name.strip).first #search for the category with the category name 				
			end

			list_restaurants = list_categories.map do |category|
				category.restaurants
			end
			@restaurants = common_factors(list_restaurants)
		end
	end


	private
	def common_factors(arrays) #find restaurant
		list = arrays[0]
		for i in (0...arrays.length)
			list = list&arrays[i]
		end
 		list
 	end


	

end
