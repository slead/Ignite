class AddFeaturedFlagToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :featured, :string
  end
end
