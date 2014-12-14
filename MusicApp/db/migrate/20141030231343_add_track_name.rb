class AddTrackName < ActiveRecord::Migration
  def change
  	add_column :tracks, :track_name, :string
  	change_column :tracks, :track_name, :string, null: false
  end
end
