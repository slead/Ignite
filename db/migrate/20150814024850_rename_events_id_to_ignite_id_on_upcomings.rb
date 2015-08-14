class RenameEventsIdToIgniteIdOnUpcomings < ActiveRecord::Migration
  def change
    rename_column :upcomings, :event_id, :ignite_id
  end
end
