class Restaurant < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	has_many :stars
	has_many :starred_by, through: :stars, source: :user
	has_and_belongs_to_many :categories
	validates :name, presence: true
	validates :description, presence: true, length: {minimum: 10}
	validates :full_address, presence: true
	validates :phone_number, presence: true, length: {is: 10}
	validates :user, presence: true
	mount_uploader :image, ImageUploader
	mount_uploader :menu, MenuUploader 
end



