class AddStatusToUpcomings < ActiveRecord::Migration
  def change
    add_column :upcomings, :status, :string
  end
end
