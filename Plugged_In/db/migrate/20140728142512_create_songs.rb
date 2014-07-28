class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :profile_id
      t.string :artist
      t.string :title
      t.string :genre

      t.timestamps
    end
  end
end
