class AddVideoCountToTags < ActiveRecord::Migration
  def change
    add_column :tags, :video_count, :integer
  end
end
