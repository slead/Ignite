class AddFeaturedFlagToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :featured, :boolean
  end
end
