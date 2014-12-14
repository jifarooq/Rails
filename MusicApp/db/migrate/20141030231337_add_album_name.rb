class AddAlbumName < ActiveRecord::Migration
  def change
  	add_column :albums, :album_name, :string
  	change_column :albums, :album_name, :string, null: false
  end
end
