class Comment < ActiveRecord::Base
  include Voteable
  
  belongs_to :post
  belongs_to :user
end
