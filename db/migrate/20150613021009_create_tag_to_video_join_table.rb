class CreateTagToVideoJoinTable < ActiveRecord::Migration
  def change
    create_table :videos_tags, id: false do |t|
      t.integer :video_id
      t.integer :tag_id
    end
  end
end
