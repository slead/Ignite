class AddFlagToTags < ActiveRecord::Migration
  def change
    add_column :tags, :major, :boolean
  end
end
