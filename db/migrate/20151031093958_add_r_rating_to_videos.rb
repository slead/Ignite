class AddRRatingToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :R18, :boolean
  end
end
