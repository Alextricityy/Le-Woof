class RemoveTimeFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :time, :string
  end
end
