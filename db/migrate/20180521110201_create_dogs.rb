class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.text :desciption
      t.string :image_url
      t.string :size
      t.string :breed
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
