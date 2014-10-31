class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false

      #kind is recorded or live
      t.string :kind, null: false

      t.timestamps null: false
    end
  end
end
