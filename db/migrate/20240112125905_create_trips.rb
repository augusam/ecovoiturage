class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.string :departure_location
      t.string :arrival_location
      t.datetime :departure_time
      t.integer :seats_available
      t.integer :driver_id

      t.timestamps
    end
  end
end
