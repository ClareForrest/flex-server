class AddBookingRefToService < ActiveRecord::Migration[6.0]
  def change
    add_reference :services, :booking, null: false, foreign_key: true
  end
end
