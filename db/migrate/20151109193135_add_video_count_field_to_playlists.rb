class AddVideoCountFieldToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :video_count, :integer
  end
end
