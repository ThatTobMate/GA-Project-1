class Comment < ActiveRecord::Base
  attr_accessible :content, :multi_id, :multi_type, :user_id
  belongs_to :user
  belongs_to :multi , :polymorphic => true
end
