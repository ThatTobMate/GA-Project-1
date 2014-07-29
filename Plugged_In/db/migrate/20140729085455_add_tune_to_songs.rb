class AddTuneToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :tune, :text
  end
end
