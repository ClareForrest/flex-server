class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :location
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
