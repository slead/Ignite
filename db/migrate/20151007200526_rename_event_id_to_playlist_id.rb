class RenameEventIdToPlaylistId < ActiveRecord::Migration
  def change
    rename_column :playlists_videos, :event_id, :playlist_id
  end
end
