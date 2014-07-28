class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.text :about
      t.text :avatar
      t.text :background_image
      t.text :header_image

      t.timestamps
    end
  end
end
