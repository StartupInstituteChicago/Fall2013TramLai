class AddRestaurantIdToStar < ActiveRecord::Migration
  def change
    add_column :stars, :restaurant_id, :integer
  end
end
