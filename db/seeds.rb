categories = ['Indian', "Vietnamese", "Chinese", "Polish", "Japanese", "Korean","Thai", "Mexican", "Vegetarian","American" ]

categories.each do |category|
	Category.find_or_create_by(name: category)
end
