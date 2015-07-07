class RemoveForeignKeyFromVotesPosts < ActiveRecord::Migration
  def change
    remove_foreign_key "votes", column: "voteable_id"
  end
end
