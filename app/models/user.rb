class User < ActiveRecord::Base
  has_many :restaurants
  has_many :reservations, through: :restaurant
  has_many :stars
  has_many :starred_restaurants, through: :stars
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable


  def owner?
    return true if role == 'owner'
    false
  end

  def patron?
    return true if role == "patron"
    false
  end




end
