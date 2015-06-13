class RenameTagToTagsOnVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :tag, :tags
  end
end
