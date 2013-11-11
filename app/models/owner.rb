class Owner < ActiveRecord::Base
	has_many :restaurants
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true
	validates :name, presence: true
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
