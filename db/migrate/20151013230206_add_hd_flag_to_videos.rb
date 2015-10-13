class AddHdFlagToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :hd, :boolean
  end
end
