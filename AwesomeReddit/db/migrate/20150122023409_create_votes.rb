class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.integer :user_id, null: false
    	t.integer :post_id, null: false
      t.integer :value, null: false

      t.timestamps
    end

    add_index :votes, :post_id
    add_index :votes, [:post_id, :user_id], unique: true
  end
end
