class Comment < ActiveRecord::Base
  beongs_to :post
  belongs_to :user
end
