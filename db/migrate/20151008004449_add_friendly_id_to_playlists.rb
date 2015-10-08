class AddFriendlyIdToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :slug, :string
  end
end
