class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.string :requested_date_time
      t.text :message
    end
  end
end
