class AddUserIdToStar < ActiveRecord::Migration
  def change
    add_column :stars, :user_id, :integer
  end
end
