class CreateStarts < ActiveRecord::Migration
  def change
    create_table :starts do |t|

      t.timestamps
    end
  end
end
