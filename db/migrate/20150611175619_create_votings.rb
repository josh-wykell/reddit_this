class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.references :post, index: true, foreign_key: true
      t.references :user, index: true, foereign_key: true
      t.timestamps null: false
    end
  end
end
