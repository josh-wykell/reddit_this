class CreateDownVotes < ActiveRecord::Migration
  def change
    create_table :down_votes do |t|
      t.string :user_id
      t.string :post_id
    end
  end
end
