class DownVote < ActiveRecord::Base
  belongs_to :voteable, :polymorphic => true, :counter_cache => true
  belongs_to :user
  
  validates_uniqueness_of :user_id
end