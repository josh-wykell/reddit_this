class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates_uniqueness_of :user_id
end
