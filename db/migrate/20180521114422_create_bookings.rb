class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :dog, foreign_key: true
      t.references :user, foreign_key: true
      t.string :time
      t.integer :price
      t.text :details

      t.timestamps
    end
  end
end
