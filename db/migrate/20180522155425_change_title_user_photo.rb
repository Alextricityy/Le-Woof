class ChangeTitleUserPhoto < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :image_url
    add_column :users, :photo, :string
  end
end
