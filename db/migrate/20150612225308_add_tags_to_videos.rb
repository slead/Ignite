class AddTagsToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :tag, :string
  end
end
