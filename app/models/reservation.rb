class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	validates :email, presence: true
	validates :requested_date_time, presence: true
	
end
