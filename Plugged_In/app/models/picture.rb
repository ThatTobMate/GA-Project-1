class Picture < ActiveRecord::Base
  attr_accessible :album_id, :caption, :description, :image
  belongs_to :album
  has_many :comments, :as => :multi
end
