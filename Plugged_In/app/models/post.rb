class Post < ActiveRecord::Base
  attr_accessible :content, :profile_id
  belongs_to :profile
  has_many :comments, :as => :multi
end
