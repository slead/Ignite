class CreatePlaylistToVideoJoinTable < ActiveRecord::Migration
  def change
    create_table :playlists_videos, id: false do |t|
      t.belongs_to :event, index: true
      t.belongs_to :video, index: true
    end
  end
end
