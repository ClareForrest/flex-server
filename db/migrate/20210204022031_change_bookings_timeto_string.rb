class ChangeBookingsTimetoString < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :time, :string
  end
end
