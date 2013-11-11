class Restaurant < ActiveRecord::Base
	belongs_to :owner
	validates :name, presence: true
	validates :description, presence: true, length: {minimum: 10}
	validates :full_address, presence: true
	validates :phone_number, presence: true, length: {is: 10}
	mount_uploader :image, ImageUploader
	mount_uploader :menu, MenuUploader 
end
