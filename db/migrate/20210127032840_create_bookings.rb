class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :location
      t.string :service
      t.string :therapist
      t.date :date
      t.time :time
      t.integer :cost

      t.timestamps
    end
  end
end
