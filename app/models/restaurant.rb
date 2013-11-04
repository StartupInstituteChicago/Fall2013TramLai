class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true, 
                          length: {minimum: 10}
  validates :phone_number, presence: true, length: {is: 10}
  
  mount_uploader :image, ImageUploader
  
  
  def destroy_image
    self.image = ""
    self.save
  end
end
