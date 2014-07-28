class Profile < ActiveRecord::Base
  attr_accessible :about, :avatar, :background_image, :header_image, :user_id
  belongs_to :user
  has_many :posts
  has_many :albums
  has_many :songs
end
