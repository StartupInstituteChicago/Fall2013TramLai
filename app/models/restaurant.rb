class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true, 
                          length: {minimum: 10}
  validates :phone_number, presence: true, length: {is: 10}
  
 
end
