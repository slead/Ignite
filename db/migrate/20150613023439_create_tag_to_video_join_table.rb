class CreateTagToVideoJoinTable < ActiveRecord::Migration
  def change
    create_table :tags_videos, id: false do |t|
      t.belongs_to :video, index: true
      t.belongs_to :tag, index: true
    end
  end
end
