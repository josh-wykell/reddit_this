class RemoveDownvotes < ActiveRecord::Migration
  def up
    drop_table :down_votes
  end

  def down
   create_table :down_votes do |t|
    t.string :user_id
    t.string :post_id
  end
end
end
