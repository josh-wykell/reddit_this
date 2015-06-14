class RenameVotesTableToUpvotesTable < ActiveRecord::Migration
  def change
    rename_table :votes, :upvotes
  end
end
