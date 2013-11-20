class Category < ActiveRecord::Base
	has_and_belongs_to_many :restaurants

	# def self.search(search)
	# 	if search
	# 		@category = Category.where( 'name LIKE ?', search)
	# 	else
	# 		@category = []
	# 	end
	# end

end
