class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|

      t.timestamps null: false
    end
  end
end
