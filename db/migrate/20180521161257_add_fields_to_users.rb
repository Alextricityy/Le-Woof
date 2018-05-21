class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :postcode, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :bio, :text
    add_column :users, :borrower, :boolean
    add_column :users, :owner, :boolean
    add_column :users, :image_url, :string
  end
end
