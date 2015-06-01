class ChangeCityToAddress < ActiveRecord::Migration
  def change
    rename_column :events, :city, :address
  end
end
