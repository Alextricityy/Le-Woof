class RemoveAddressFromDogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :address, :string
  end
end
