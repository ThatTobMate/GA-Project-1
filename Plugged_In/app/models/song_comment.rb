class SongComment < ActiveRecord::Base
  attr_accessible :content, :song_id, :user_id
  belongs_to :user
  belongs_to :song
end
