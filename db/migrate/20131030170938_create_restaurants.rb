class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :full_address
      t.string :phone_number

      t.timestamps
    end
  end
end
