class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :new
      t.string :create
      t.string :edit
      t.string :update
      t.string :destroy
      t.string :show

      t.timestamps
    end
  end
end
