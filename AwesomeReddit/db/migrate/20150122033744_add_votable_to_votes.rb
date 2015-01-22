class AddVotableToVotes < ActiveRecord::Migration
  def change
  	add_column :votes, :votable_id, :integer, null: false
  	add_column :votes, :votable_type, :string, null: false
  end
end
