class Song < ActiveRecord::Base
  attr_accessible :artist, :genre, :profile_id, :title
  belongs_to :profile
  has_many :comments, :as => :multi
end
