class Album < ActiveRecord::Base
  attr_accessible :image, :profile_id, :title
  belongs_to :profile
  has_many :pictures
end
