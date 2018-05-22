class AddPhotoToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :photo, :string
    remove_column :dogs, :image_url
  end
end
