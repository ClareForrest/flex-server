class AddServicesToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :service, null: false, foreign_key: true
  end
end
