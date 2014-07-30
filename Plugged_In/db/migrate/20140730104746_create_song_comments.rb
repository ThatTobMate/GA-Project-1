class CreateSongComments < ActiveRecord::Migration
  def change
    create_table :song_comments do |t|
      t.integer :user_id
      t.integer :song_id
      t.text :content

      t.timestamps
    end
  end
end
