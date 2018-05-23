class ChangePriceToFloat < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :price
    add_column :dogs, :price, :float
    remove_column :bookings, :price
    add_column :bookings, :price, :float
  end
end
