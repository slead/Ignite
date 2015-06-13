class AddUserIdToUpcomings < ActiveRecord::Migration
  def change
    add_column :upcomings, :user_id, :integer
  end
end
