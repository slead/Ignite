class AddTwitterNameToEvents < ActiveRecord::Migration
  def change
    add_column :events, :twitter_name, :string
  end
end
