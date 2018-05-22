class ChangeDobToDate < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :date_of_birth
    add_column :users, :date_of_birth, :date
  end
end
