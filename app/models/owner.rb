class Owner < ActiveRecord::Base
	has_many :restaurants
	has_many :reservations, through: :restaurant
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true
	validates :name, presence: true
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
