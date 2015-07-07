class MakeVotingPolymorphic < ActiveRecord::Migration
  def change
    rename_column :votes, :post_id, :voteable_id
    change_column :votes, :voteable_id, :integer, :index => true, :foreign_key => false
    add_column :votes, :voteable_type, :string 
    add_column :comments, :votes_count, :integer, default: 0
  end
end
