class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :profile_id
      t.string :title
      t.text :image

      t.timestamps
    end
  end
end
