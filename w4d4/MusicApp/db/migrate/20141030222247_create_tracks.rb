class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :kind, null: false

      t.timestamps null: false
    end
  end
end
