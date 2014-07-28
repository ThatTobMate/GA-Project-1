class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :multi_id
      t.string :multi_type
      t.text :content

      t.timestamps
    end
  end
end
