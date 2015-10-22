class AddListedFlagToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :listed, :boolean
  end
end
