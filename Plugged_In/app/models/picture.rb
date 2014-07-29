class Picture < ActiveRecord::Base
  attr_accessible :album_id, :caption, :description, :image
  mount_uploader :image, ImageUploader
  belongs_to :album
  has_many :comments, :as => :multi
end
