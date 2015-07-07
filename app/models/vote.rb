class Vote < ActiveRecord::Base
  belongs_to :voteable, :polymorphic => true, :counter_cache => true
  belongs_to :user
  # belongs_to :post, :counter_cache => true

  validates_uniqueness_of :voteable_id, :scope => [:user_id, :voteable_type]
end
