class RemoveBookingFromServices < ActiveRecord::Migration[6.0]
  def change
    remove_column :services, :booking_id
  end
end
