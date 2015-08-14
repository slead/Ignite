class RenameEventsIdToIgniteIdOnVideos < ActiveRecord::Migration
  def change
    rename_column :videos, :event_id, :ignite_id
  end
end
