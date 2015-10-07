class AddPlaylistsToEvents < ActiveRecord::Migration
  def change
    create_table :playlists_events, id: false do |t|
      t.belongs_to :event, index: true
      t.belongs_to :playlist, index: true
    end
  end
end
