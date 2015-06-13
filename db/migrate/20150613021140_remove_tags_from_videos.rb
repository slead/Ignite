class RemoveTagsFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :tags
  end
end
