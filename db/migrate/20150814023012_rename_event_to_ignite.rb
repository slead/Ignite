class RenameEventToIgnite < ActiveRecord::Migration
  def change
    rename_table :events, :ignites
  end
end
