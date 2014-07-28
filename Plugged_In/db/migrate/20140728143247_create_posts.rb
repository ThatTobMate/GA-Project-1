class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :profile_id
      t.text :content

      t.timestamps
    end
  end
end
