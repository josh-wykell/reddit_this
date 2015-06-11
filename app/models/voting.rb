class Voting < ActiveRecord::Base
  belongs_to :post
  belongs_to :vote
end
