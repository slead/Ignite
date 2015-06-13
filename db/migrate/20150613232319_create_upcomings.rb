class CreateUpcomings < ActiveRecord::Migration
  def change
    create_table :upcomings do |t|
      t.string :name
      t.integer :event_id
      t.date :date

      t.timestamps
    end
  end
end
