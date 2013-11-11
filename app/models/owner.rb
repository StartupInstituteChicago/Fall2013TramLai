class Owner < ActiveRecord::Base
	has_many :restaurants
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
